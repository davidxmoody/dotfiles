-- TODO list for lsp/completion:
-- - Show messages and/or error counts in status line
-- - Try out other lsp go to commands (implementation maybe?)
-- - Try out better quickfix list navigation and maybe use that instead of telescope
-- - Get eslint/tslint working (also shellcheck and maybe markdownlint)
vim.o.completeopt = "menuone,noselect"

require"compe".setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "enable",
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,

  source = {
    path = true,
    nvim_lsp = true,
    nvim_lua = true,
    buffer = false,
    calc = false,
    vsnip = false,
    spell = false,
    tags = false,
    omni = false,
    snippets_nvim = false,
    treesitter = false,
  },
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col(".") - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
    return true
  else
    return false
  end
end

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn["compe#complete"]()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()",
  {silent = true, expr = true})

vim.api.nvim_set_keymap("i", "<CR>",
  [[compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })]],
  {silent = true, expr = true})