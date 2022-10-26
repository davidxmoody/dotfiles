-- Misc options

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hidden = true
vim.opt.joinspaces = false
vim.opt.showcmd = false
vim.opt.undofile = true
vim.opt.backupcopy = "yes"
vim.opt.clipboard = "unnamedplus"
vim.opt.suffixesadd = ".ts,.tsx,.js,.jsx,.json,.coffee,.scss,.css"
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.mouse = "nv"
vim.g.vimsyn_embed = "l"

vim.cmd("au TextYankPost * lua vim.highlight.on_yank {}")

vim.opt_local.spelllang = "en_gb"
if vim.fn.filereadable(vim.env.VIM_SPELLFILE) == 1 then
  vim.opt.spellfile = vim.env.VIM_SPELLFILE
end

-- Indenting

vim.opt.tabstop = 2
vim.opt.shiftwidth = 0
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.shiftround = true

-- Wrapping

vim.opt.wrap = false
vim.opt.showbreak = "↪ "
vim.opt.list = true
vim.opt.listchars = { tab = "→ ", nbsp = "␣", trail = "•", extends = "⟩", precedes = "⟨" }
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 2

-- Auto window resizing

vim.opt.equalalways = true
vim.cmd("autocmd VimResized * wincmd =")

-- Auto wrap comments

vim.opt.formatoptions = "rqn1j"
vim.opt.textwidth = 79
