local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

-- Misc options

opt('o', 'ignorecase', true)
opt('o', 'smartcase', true)
opt('o', 'hidden', true)
opt('o', 'joinspaces', false)
opt('o', 'showcmd', false)
opt('b', 'undofile', true)
opt('b', 'backupcopy', 'yes')
opt('o', 'clipboard', 'unnamedplus')
opt('b', 'suffixesadd', '.ts,.tsx,.js,.jsx,.json,.coffee,.scss,.css')
vim.cmd('set mouse=nv')

-- Indenting

local indent = 2
opt('b', 'tabstop', indent)
opt('b', 'shiftwidth', indent)
opt('b', 'softtabstop', indent)
opt('b', 'expandtab', true)
opt('b', 'smartindent', true)
opt('o', 'shiftround', true)

-- Wrapping

opt('w', 'wrap', false)
opt('o', 'showbreak', '↪ ')
opt('w', 'list', true)
opt('w', 'listchars', 'tab:→ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨')
opt('o', 'scrolloff', 2)
opt('o', 'sidescrolloff', 2)

-- Auto window resizing

opt('o', 'equalalways', true)
vim.cmd('autocmd VimResized * wincmd =')

-- Auto wrap comments

opt('b', 'formatoptions', 'rqn1j')
opt('b', 'textwidth', 79)

-- opt('o', 'completeopt', 'menuone,noinsert,noselect')  -- Completion options (for deoplete)
-- opt('o', 'splitbelow', true)                          -- Put new windows below current
-- opt('o', 'splitright', true)                          -- Put new windows right of current
-- opt('o', 'termguicolors', true)                       -- True color support
-- opt('o', 'wildmode', 'list:longest')                  -- Command-line completion mode
-- opt('w', 'relativenumber', true)                      -- Relative line numbers
-- vim.cmd 'colorscheme desert'                              -- Put your favorite colorscheme here
