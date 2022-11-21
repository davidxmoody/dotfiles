require("lspfuzzy").setup({})

local nvim_lsp = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(_, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = {noremap = true, silent = true}
  buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "gl", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "gR", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "gs", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "gS", "<Cmd>lua vim.diagnostic.open_float()<CR>", opts)
  buf_set_keymap("n", "_", "<Cmd>lua vim.diagnostic.goto_next()<CR>", opts)
end

local settings = {
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
}

-- local servers = {"denols"}
local servers = {"tsserver", "sumneko_lua"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = settings,
  })
end
