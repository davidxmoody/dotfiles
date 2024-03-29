import {
  KarabinerComplexModifications,
  Key,
  Manipulator,
} from "https://deno.land/x/karabiner@v0.2.0/karabiner.ts";

const dv = {
  semicolon: "q",
  comma: "w",
  period: "e",
  p: "r",
  y: "t",
  f: "y",
  g: "u",
  c: "i",
  r: "o",
  l: "p",

  a: "a",
  o: "s",
  e: "d",
  u: "f",
  i: "g",
  d: "h",
  h: "j",
  t: "k",
  n: "l",
  s: "semicolon",

  quote: "z",
  q: "x",
  j: "c",
  k: "v",
  x: "b",
  b: "n",
  m: "m",
  w: "comma",
  v: "period",
  z: "slash",
} as const;

const mods = new KarabinerComplexModifications();

const sdName = "superduper-mode";

function sd(fromKey: Key, toKey: Key, modifiers?: Key[]): Manipulator {
  return {
    type: "basic",
    conditions: [
      { name: sdName, type: "variable_if", value: 1 },
    ],
    from: { key_code: fromKey, modifiers: { optional: ["any"] } },
    to: [{ key_code: toKey, modifiers }],
  };
}

mods.addRule({
  description: "Super Duper Mode",
  manipulators: [
    {
      type: "basic",
      from: {
        simultaneous: [{ key_code: dv.o }, { key_code: dv.e }],
        simultaneous_options: {
          detect_key_down_uninterruptedly: true,
          key_down_order: "insensitive",
          key_up_order: "insensitive",
          key_up_when: "any",
          to_after_key_up: [
            { set_variable: { name: sdName, value: 0 } },
          ],
        },
      } as any,
      to: [{ set_variable: { name: sdName, value: 1 } }],
    },
    sd(dv.h, "left_arrow"),
    sd(dv.t, "down_arrow"),
    sd(dv.n, "up_arrow"),
    sd(dv.s, "right_arrow"),
    sd(dv.a, "left_option"),
    sd(dv.u, "right_command"),
    sd("spacebar", "right_shift"),
    sd(dv.g, "left_arrow", ["left_option"]),
    sd(dv.l, "right_arrow", ["left_option"]),
    sd(dv.w, "delete_or_backspace", ["left_option"]),
    sd(dv.m, "return_or_enter"),
    sd(dv.c, "delete_or_backspace"),
    sd(dv.r, "delete_forward"),
  ],
});

mods.addRule({
  description: "Swap semicolon and double quote",
  manipulators: [
    {
      type: "basic",
      from: { key_code: dv.semicolon },
      to: [{ key_code: dv.quote, modifiers: ["left_shift"] }],
    },
    {
      type: "basic",
      from: { key_code: dv.quote, modifiers: { mandatory: ["right_shift"] } },
      to: [{ key_code: dv.semicolon }],
    },
    {
      type: "basic",
      from: { key_code: dv.quote, modifiers: { mandatory: ["left_shift"] } },
      to: [{ key_code: dv.semicolon }],
    },
  ],
});

const configFile = Deno.args[0];
mods.writeToProfile("Default profile", configFile);
