local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= "o" then
    scopes["o"][key] = value
  end
end

-- Misc options

opt("o", "ignorecase", true)
opt("o", "smartcase", true)
opt("o", "hidden", true)
opt("o", "joinspaces", false)
opt("o", "showcmd", false)
opt("b", "undofile", true)
opt("b", "backupcopy", "yes")
opt("o", "clipboard", "unnamedplus")
opt("b", "suffixesadd", ".ts,.tsx,.js,.jsx,.json,.coffee,.scss,.css")
opt("o", "termguicolors", true)
opt("w", "cursorline", true)

vim.g.vimsyn_embed = "l"
vim.cmd("set mouse=nv")
vim.cmd("au TextYankPost * lua vim.highlight.on_yank {}")

if vim.fn.filereadable(vim.env.VIM_SPELLFILE) then
  opt("b", "spellfile", vim.env.VIM_SPELLFILE)
end

-- Indenting

local indent = 2
opt("b", "tabstop", indent)
opt("b", "shiftwidth", indent)
opt("b", "softtabstop", indent)
opt("b", "expandtab", true)
opt("b", "smartindent", true)
opt("o", "shiftround", true)

-- Wrapping

opt("w", "wrap", false)
opt("o", "showbreak", "↪ ")
opt("w", "list", true)
opt("w", "listchars", "tab:→ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨")
opt("o", "scrolloff", 2)
opt("o", "sidescrolloff", 2)

-- Auto window resizing

opt("o", "equalalways", true)
vim.cmd("autocmd VimResized * wincmd =")

-- Auto wrap comments

opt("b", "formatoptions", "rqn1j")
opt("b", "textwidth", 79)
