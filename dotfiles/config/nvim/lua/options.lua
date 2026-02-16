vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.undofile = true
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.mouse = "nv"

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({})
  end,
})

vim.opt_local.spelllang = "en_gb"
if vim.fn.filereadable(vim.env.VIM_SPELLFILE) == 1 then
  vim.opt.spellfile = vim.env.VIM_SPELLFILE
end

vim.opt.tabstop = 2
vim.opt.shiftwidth = 0
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.shiftround = true

vim.opt.wrap = false
vim.opt.showbreak = "↪ "
vim.opt.list = true
vim.opt.listchars = {
  tab = "→ ",
  nbsp = "␣",
  trail = "•",
  extends = "⟩",
  precedes = "⟨",
}
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 2

vim.opt.equalalways = true
vim.api.nvim_create_autocmd("VimResized", {command = "wincmd ="})

vim.opt.formatoptions = "rqn1j"
vim.opt.textwidth = 79

function CustomStatusline()
  if (vim.bo.filetype == "NvimTree") then
    return "NvimTree"
  end

  return table.concat({
    vim.bo.modified and "%#ModifiedFlag#" or "",
    "%<%f",
    "%*",
    " %h%q%r",
    "%= ",
    "%03.(%c%) %07.(%l/%L%)",
    "%( %y%)",
  })
end

vim.opt.statusline = "%{%v:lua.CustomStatusline()%}"
