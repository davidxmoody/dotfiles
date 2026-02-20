vim.opt_local.wrap = true
vim.opt_local.showbreak = "NONE"
vim.opt_local.listchars = {
  tab = "→ ",
  nbsp = "␣",
  extends = "⟩",
  precedes = "⟨",
}
vim.opt_local.cursorline = false
vim.opt_local.linebreak = true
vim.opt_local.breakat = " "
vim.opt_local.formatoptions = ""
vim.opt_local.spell = true

vim.opt_local.softtabstop = 0
vim.opt_local.smarttab = false
vim.opt_local.autoindent = false
vim.opt_local.scrolloff = 0

vim.keymap.set("n", "<C-K>", "cl<CR><CR><Esc>", {buffer = true})
