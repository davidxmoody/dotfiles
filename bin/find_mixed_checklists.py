#!/usr/bin/env python3
"""Find markdown files containing partially-checkboxed lists.

A list is reported as "mixed" when a *single* list contains both task items
(``- [ ]``, ``- [x]`` or ``- [-]``) and plain items with no checkbox prefix. A plain list
and a separate, fully-checkboxed list in the same file do not count.

Usage:
    python find_mixed_checklists.py [PATH ...] [-v]

Exit status is 1 when at least one mixed list is found (handy in CI).
"""

from __future__ import annotations

import argparse
import re
import sys
from dataclasses import dataclass, field
from pathlib import Path

TAB_WIDTH = 4
DEFAULT_EXTENSIONS = (".md", ".markdown", ".mdown", ".mkd")

LIST_ITEM_RE = re.compile(
    r"^(?P<lead>[ \t]*)(?P<marker>[-*+]|\d{1,9}[.)])(?P<space>[ \t]+)(?P<content>.*)$"
)
# A checkbox is exactly one of space/x/X/- in brackets, followed by whitespace or
# end of line. This deliberately excludes links such as "- [x](http://...)".
CHECKBOX_RE = re.compile(r"^\[[ xX+-]\](?:[ \t]|$)")
FENCE_RE = re.compile(r"^[ \t]*(?P<fence>`{3,}|~{3,})(?P<info>.*)$")
# Constructs that always break out of a paragraph / list item.
HEADING_RE = re.compile(r"^[ \t]{0,3}#{1,6}(?:[ \t]|$)")
THEMATIC_BREAK_RE = re.compile(
    r"^[ \t]{0,3}(?:(?:\*[ \t]*){3,}|(?:-[ \t]*){3,}|(?:_[ \t]*){3,})$"
)
BLOCKQUOTE_RE = re.compile(r"^[ \t]{0,3}>")


def indent_width(text: str) -> int:
    """Width of a whitespace prefix, expanding tabs to the next tab stop."""
    width = 0
    for ch in text:
        if ch == "\t":
            width += TAB_WIDTH - (width % TAB_WIDTH)
        else:
            width += 1
    return width


def marker_kind(marker: str) -> str:
    """Bullet char, or the delimiter for ordered lists. A change starts a new list."""
    return marker if marker in "-*+" else "ordered" + marker[-1]


@dataclass
class ListBlock:
    indent: int
    content_indent: int
    marker: str
    start_line: int
    end_line: int = 0
    task_lines: list[int] = field(default_factory=list)
    plain_lines: list[int] = field(default_factory=list)

    @property
    def is_mixed(self) -> bool:
        return bool(self.task_lines) and bool(self.plain_lines)


def find_mixed_lists(text: str, blank_splits: bool = False) -> list[ListBlock]:
    """Return every list block in *text* that mixes task items and plain items."""
    lines = text.splitlines()
    mixed: list[ListBlock] = []
    stack: list[ListBlock] = []
    in_fence = False
    fence_char = ""
    fence_len = 0
    blanks = 0
    start = 0

    # Skip YAML front matter, which is full of "- item" lines that aren't lists.
    if lines and lines[0].strip() == "---":
        for i in range(1, len(lines)):
            if lines[i].strip() in ("---", "..."):
                start = i + 1
                break

    def close(block: ListBlock) -> None:
        if block.is_mixed:
            mixed.append(block)

    def close_all() -> None:
        while stack:
            close(stack.pop())

    def close_outdented(width: int) -> None:
        while stack and width < stack[-1].content_indent:
            close(stack.pop())

    for lineno, line in enumerate(lines[start:], start + 1):
        if in_fence:
            fence = FENCE_RE.match(line)
            if (
                fence
                and fence.group("fence")[0] == fence_char
                and len(fence.group("fence")) >= fence_len
                and not fence.group("info").strip()
            ):
                in_fence = False
            continue

        if not line.strip():
            blanks += 1
            # One blank line keeps a (loose) list open; two end it.
            if blanks >= 2 or blank_splits:
                close_all()
            continue

        lead = line[: len(line) - len(line.lstrip(" \t"))]
        width = indent_width(lead)
        item = LIST_ITEM_RE.match(line)

        if item:
            content_indent = indent_width(
                item.group("lead") + item.group("marker") + item.group("space")
            )
            kind = marker_kind(item.group("marker"))

            while stack and width < stack[-1].indent:
                close(stack.pop())

            if stack and width >= stack[-1].content_indent:
                block = None  # indented past the parent's content: a nested list
            elif stack and stack[-1].marker == kind:
                block = stack[-1]  # same level, same bullet style: same list
            else:
                if stack:
                    close(stack.pop())  # same level, different bullet: new list
                block = None

            if block is None:
                block = ListBlock(width, content_indent, kind, lineno)
                stack.append(block)

            block.end_line = lineno
            if CHECKBOX_RE.match(item.group("content")):
                block.task_lines.append(lineno)
            else:
                block.plain_lines.append(lineno)
            blanks = 0
            continue

        fence = FENCE_RE.match(line)
        interrupts = bool(
            fence
            or HEADING_RE.match(line)
            or THEMATIC_BREAK_RE.match(line)
            or BLOCKQUOTE_RE.match(line)
        )
        # An unindented paragraph right after an item is a lazy continuation of
        # it; after a blank line, or for a block-level construct, it ends the list.
        if interrupts or blanks:
            close_outdented(width)
        blanks = 0

        if fence:
            in_fence = True
            fence_char = fence.group("fence")[0]
            fence_len = len(fence.group("fence"))

    close_all()
    mixed.sort(key=lambda b: b.start_line)
    return mixed


def iter_markdown_files(paths, extensions, include_hidden=False):
    suffixes = {e.lower() for e in extensions}
    for raw in paths:
        root = Path(raw)
        if root.is_file():
            yield root
            continue
        if not root.exists():
            print(f"warning: no such path: {root}", file=sys.stderr)
            continue
        for path in sorted(root.rglob("*")):
            if path.suffix.lower() not in suffixes or not path.is_file():
                continue
            if not include_hidden and any(
                part.startswith(".") for part in path.relative_to(root).parts
            ):
                continue
            yield path


def main(argv=None) -> int:
    parser = argparse.ArgumentParser(
        description="Find markdown files where a single list mixes checkbox items with plain items."
    )
    parser.add_argument(
        "paths", nargs="*", default=["."], help="files or directories (default: .)"
    )
    parser.add_argument(
        "-v", "--verbose", action="store_true", help="show the offending lines"
    )
    parser.add_argument(
        "-e",
        "--ext",
        action="append",
        metavar="EXT",
        help=f"extension to scan, repeatable (default: {' '.join(DEFAULT_EXTENSIONS)})",
    )
    parser.add_argument(
        "--hidden", action="store_true", help="also scan dot-directories"
    )
    parser.add_argument(
        "--blank-splits",
        action="store_true",
        help="treat any blank line as ending a list (stricter; fewer hits)",
    )
    args = parser.parse_args(argv)

    extensions = args.ext or list(DEFAULT_EXTENSIONS)
    extensions = [e if e.startswith(".") else "." + e for e in extensions]

    found = False
    for path in iter_markdown_files(args.paths or ["."], extensions, args.hidden):
        try:
            text = path.read_text(encoding="utf-8", errors="replace")
        except OSError as exc:
            print(f"warning: cannot read {path}: {exc}", file=sys.stderr)
            continue

        blocks = find_mixed_lists(text, blank_splits=args.blank_splits)
        if not blocks:
            continue

        found = True
        print(path)
        if args.verbose:
            lines = text.splitlines()
            for block in blocks:
                print(
                    f"  list at lines {block.start_line}-{block.end_line}: "
                    f"{len(block.task_lines)} with checkbox, {len(block.plain_lines)} without"
                )
                for lineno in block.plain_lines:
                    print(f"    {lineno}: {lines[lineno - 1].rstrip()}")

    return 1 if found else 0


if __name__ == "__main__":
    sys.exit(main())
