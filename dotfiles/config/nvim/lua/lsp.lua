require("lspfuzzy").setup({})

local nvim_lsp = require("lspconfig")

local on_attach = function(client, bufnr)
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
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "gR", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "gS",
    "<Cmd>lua vim.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap("n", "gs", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "_", "<Cmd>lua vim.diagnostic.goto_next()<CR>", opts)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- local servers = {"denols"}
local servers = {"tsserver"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup({on_attach = on_attach, capabilities = capabilities})
end
