local nvim_lsp = require("lspconfig")

require("lspfuzzy").setup({})

-- local servers = {"denols"}
local servers = {"tsserver", "sumneko_lua"}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup({
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    settings = {
      Lua = {
        runtime = {version = "LuaJIT"},
        diagnostics = {globals = {"vim", "hs"}},
        workspace = {
          library = {
            vim.fn.expand("$VIMRUNTIME/lua"),
            vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
            "/Applications/Hammerspoon.app/Contents/Resources/extensions/hs/",
          },
        },
        telemetry = {enable = false},
      },
    },
  })
end
