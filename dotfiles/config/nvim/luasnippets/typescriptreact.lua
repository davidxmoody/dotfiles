local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node

return {
  s("react", {
    ls.text_node({"interface Props {", "\t"}),
    i(1, "// TODO"),
    ls.text_node({"", "}", "", "export default function "}),
    f(function()
      return vim.fn.expand("%:t:r")
    end),
    ls.text_node("(props: Props) {"),
    ls.text_node({"", "\treturn (", "\t\t"}),
    i(2, "<></>"),
    ls.text_node({"", "\t)", "}"}),
  }),
}
