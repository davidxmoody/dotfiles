import {
  KarabinerComplexModifications,
  Key,
  Manipulator,
} from "https://deno.land/x/karabiner@v0.2.0/karabiner.ts";

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
        simultaneous: [{ key_code: "s" }, { key_code: "d" }],
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
    sd("j", "left_arrow"),
    sd("k", "down_arrow"),
    sd("l", "up_arrow"),
    sd("semicolon", "right_arrow"),
    sd("a", "left_option"),
    sd("f", "right_command"),
    sd("spacebar", "right_shift"),
    sd("u", "left_arrow", ["left_option"]),
    sd("p", "right_arrow", ["left_option"]),
  ],
});

mods.addRule({
  description: "Esc on Ctrl tap",
  manipulators: (["left_control", "caps_lock"] as const).map((key) => ({
    type: "basic",
    from: { key_code: key, modifiers: { optional: ["any"] } },
    to: [{ key_code: "left_control", lazy: true }],
    to_if_alone: [{ key_code: "escape" }],
  })),
});

mods.print();
