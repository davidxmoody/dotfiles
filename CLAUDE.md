# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles for MacOS. Uses Dvorak keyboard layout throughout — keybindings in tmux, nvim, AeroSpace, and Karabiner all use Dvorak-position keys (h/t/n/s instead of h/j/k/l for left/down/up/right).

## Repository Structure

- `dotfiles/` — Config files symlinked to `~/.<filename>` (or copied if suffixed `.copy`). Subdirectories under `dotfiles/config/` map to `~/.config/`.
- `bin/` — Shell scripts added to PATH via `$RC_DIR/bin` (where `RC_DIR=~/p/dotfiles`).
- `karabiner-config.ts` — Deno/TypeScript script generating Karabiner complex modifications (Super Duper Mode, semicolon/quote swap).
- `pyproject.toml` — Poetry project providing pynvim for Neovim Python support.

## Setup Commands

- `bin/setup-link-dotfiles` — Symlinks dotfiles into `$HOME` (files ending `.copy` are copied instead). Also creates `~/t`, `~/p`, `~/.vim-swap`, `~/.config` directories.
- `bin/setup-check-deps` — Checks that required tools are installed (brew, neovim, ripgrep, fzf, tmux, node, etc.).
- `bin/karabiner-config` — Regenerates Karabiner config: `deno run` on `karabiner-config.ts`.

## Key Conventions

- **Dvorak layout**: All navigation keybindings use Dvorak home row positions. The `dv` mapping object in `karabiner-config.ts` translates Dvorak keys to QWERTY key codes.
- **Shell**: Bash (not zsh). `bashrc` is the main config, sources `bash_aliases`.
- **Editor**: Neovim (`nvim`). Config in `dotfiles/config/nvim/` uses Lua with lazy.nvim plugin manager.
- **Terminal**: Kitty and Ghostty configs in `dotfiles/config/`. Tmux prefix is `C-r`.
- **Window manager**: AeroSpace (tiling WM). Config in `dotfiles/aerospace.toml`.
- **Projects live in `~/p/`**, temp projects in `~/t/`.
- **Git aliases**: Extensive set in `bash_aliases` (e.g., `g`, `gs`, `gc`, `gl`, `gd`, `ga`, `gaa`).
