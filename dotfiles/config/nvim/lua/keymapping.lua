local function map(mode, lhs, rhs, options)
  vim.api.nvim_set_keymap(mode, lhs, rhs, vim.tbl_extend('force', {noremap = true, silent = true}, options or {}))
end

local function map_plug(mode, lhs, rhs)
  map(mode, lhs, rhs, {noremap = false})
end

-- Dvorak navigation

map('', 't', 'j')
map('', 'n', 'k')
map('', 's', 'l')

map('', 'T', '')
map('', 'N', '')
map('', 'H', '0')
map('', 'S', '$')

map('', 'gt', 'gj')
map('', 'gn', 'gk')

map('i', '+', '<Right><Esc>')
map('v', '+', '<Esc><Esc>')
map('', '+', ':update<CR>')

-- Joining

map('', 'k', 'J')
map('', 'K', 'gJ')

-- Undo/redo

map('', 'U', '<C-R>')
map('', '<C-R>', '<Nop>')

-- Terminal

map('t', '<Esc>', '<C-\\><C-n>')

-- FZF

map('', '<leader>e', ':Files<CR>')
map('', '<leader>E', ':Buffers<CR>')
map('', '<leader>o', ':GFiles?<CR>')
map('', '<leader>a', ':Rg<space>')
map('', '<leader>A', ':Rg<space><Up><CR>')
map('', '<leader>i', ":Rg<space>/<C-R>=fnameescape(expand('%:t:r'))<CR><CR>")
map('', '<leader>B', ':History<CR>')

-- File navigation

map('', '<leader>u', 'ZZ')
map('', '<leader>b', '<C-^>')
map('', '<C-d>', ':q<CR>')

-- Selection

map_plug('', '<leader>v', 'Vii')
map('', '<leader>V', 'ggVG')

-- Jumping

map_plug('', 'o', '<Plug>(easymotion-overwin-f2)')
map_plug('', 'O', '<Plug>(easymotion-overwin-f2)')
map_plug('', 'f', '<Plug>Sneak_f')
map_plug('', 'F', '<Plug>Sneak_F')
map_plug('', 'l', '<Plug>Sneak_t')
map_plug('', 'L', '<Plug>Sneak_T')
map_plug('', '(', '<Plug>Sneak_,')
map_plug('', ')', '<Plug>Sneak_;')

-- Search

map('', 'j', 'n')
map('', 'J', 'N')
map('', 'gj', 'gn')
map('', 'gJ', 'gN')

map('n', '*', ' /\\C\\<<C-R><C-W>\\><CR>')
map('n', '<leader>*', ' :Rg <C-R><C-W><CR>')
map('x', '*', ' "zy/<C-R><C-R>z<CR>')
map('x', '<leader>*', ' "zy:Rg <C-R><C-R>z<CR>')

map('n', 'gx', [[/export<CR>]])

-- Entering insertion

map('', ',', 'A')
map('', '<leader>,', 'GA')
map('', '<CR>', 'o')
map('', 'g<CR>', 'O')

-- Repeat pasting

map('x', 'gp', '"0p')
map('x', 'gP', '"0P')
map('n', 'gp', 'V"0p')
map('n', 'gP', 'V"0p')

-- Repeat operator

map('x', '.', ':norm.<CR>')
map_plug('', '<leader>.', '/\\C\\<"\\><CR>.')

-- Window splitting

map('', '<leader>h', ':aboveleft vsplit<CR>')
map('', '<leader>t', ':belowright split<CR>')
map('', '<leader>n', ':aboveleft split<CR>')
map('', '<leader>s', ':belowright vsplit<CR>')

-- Tmux window navigation

map('n', '<C-H>', ':TmuxNavigateLeft<CR>', {silent = true})
map('n', '<C-T>', ':TmuxNavigateDown<CR>', {silent = true})
map('n', '<C-N>', ':TmuxNavigateUp<CR>', {silent = true})
map('n', '<C-S>', ':TmuxNavigateRight<CR>', {silent = true})

map('v', '<C-H>', '<Esc><Esc>:TmuxNavigateLeft<CR>', {silent = true})
map('v', '<C-T>', '<Esc><Esc>:TmuxNavigateDown<CR>', {silent = true})
map('v', '<C-N>', '<Esc><Esc>:TmuxNavigateUp<CR>', {silent = true})
map('v', '<C-S>', '<Esc><Esc>:TmuxNavigateRight<CR>', {silent = true})

map('i', '<C-H>', '<Right><Esc>:TmuxNavigateLeft<CR>', {silent = true})
map('i', '<C-T>', '<Right><Esc>:TmuxNavigateDown<CR>', {silent = true})
map('i', '<C-N>', '<Right><Esc>:TmuxNavigateUp<CR>', {silent = true})
map('i', '<C-S>', '<Right><Esc>:TmuxNavigateRight<CR>', {silent = true})

map('t', '<C-H>', '<C-\\><C-N>:TmuxNavigateLeft<CR>', {silent = true})
map('t', '<C-T>', '<C-\\><C-N>:TmuxNavigateDown<CR>', {silent = true})
map('t', '<C-N>', '<C-\\><C-N>:TmuxNavigateUp<CR>', {silent = true})
map('t', '<C-S>', '<C-\\><C-N>:TmuxNavigateRight<CR>', {silent = true})

map('c', '<C-H>', '<Nop>')
map('c', '<C-T>', '<Nop>')
map('c', '<C-N>', '<Nop>')
map('c', '<C-S>', '<Nop>')

-- Git

map('', '<leader>gb', ':Git blame<CR>')
map('', '<leader>gr', ':Gread<CR>')
map('', '<leader>gw', ':Gwrite<CR>')

map_plug('', '<leader>ga', '<Plug>(GitGutterStageHunk)')
map_plug('', '<leader>gu', '<Plug>(GitGutterUndoHunk)')
map_plug('', ']h', '<Plug>(GitGutterNextHunk)')
map_plug('', '[h', '<Plug>(GitGutterPrevHunk)')
map_plug('o', 'ih', '<Plug>(GitGutterTextObjectInnerPending)')
map_plug('o', 'ah', '<Plug>(GitGutterTextObjectOuterPending)')
map_plug('x', 'ih', '<Plug>(GitGutterTextObjectInnerVisual)')
map_plug('x', 'ah', '<Plug>(GitGutterTextObjectOuterVisual)')

-- Toggle settings

map('', '<leader>w', ':set wrap!<CR>')
map('', '<leader>W', ':set colorcolumn=80<CR>')
map('', '<leader>/', ':nohlsearch<CR>')

-- Slime

map_plug('x', '<leader>p', '<Plug>SlimeRegionSend')
map_plug('n', '<leader>p', '<Plug>SlimeParagraphSend')
map_plug('n', '<leader>P', '<Plug>SlimeConfig')

-- Refactoring

map('v', '<C-K>', [[:s/^\( *\)\([^:]\+\):.*$/\1"\2",/<CR>]])

map('n', '<C-K>', 'cl<CR><Esc>lf<Space>')

map('', 'ga', ':.Subvert/{true,false}/{false,true}/g<CR>:nohlsearch<CR>')

map('n', '<leader>r', [[:%s/\<<C-R><C-W>\>/<C-R><C-W>/g<Left><Left>]])
map('x', '<leader>r', [["zy:%s/\<<C-R><C-R>z\>/<C-R><C-R>z/g<Left><Left>]])

map('', '<leader>f', ':Neoformat<CR>')

map_plug('x', '<leader>x', [["lc<C-R>=substitute(system('node -p', @l), '\n\+$', '', '')<CR><ESC>]])

map('i', '<C-K>', '<C-R>=strftime("%F")<CR>')

-- Nvim tree

map('', '-', ':NvimTreeFindFile<CR>')
map('', 'g-', ':NvimTreeToggle<CR>')

function create_nvim_tree_bindings()
  local function tree_map(key, cb_name)
    vim.api.nvim_buf_set_keymap(0, 'n', key,
      require('nvim-tree.config').nvim_tree_callback(cb_name),
      { noremap = true, silent = true, nowait = true })
  end

  tree_map("<CR>", "edit")
  tree_map("i", "edit")
  tree_map("<2-LeftMouse>", "edit")
  tree_map("g<CR>", "cd")
  tree_map("gi", "cd")
  tree_map("[h", "prev_git_item")
  tree_map("]h", "next_git_item")
  tree_map("-", "dir_up")
  tree_map("a", "create")
  tree_map("a", "create")
  tree_map("d", "remove")
  tree_map("x", "cut")
  tree_map("y", "copy")
  tree_map("Y", "copy_path")
  tree_map("gy", "copy_absolute_path")
  tree_map("p", "paste")
  tree_map("r", "rename")
  tree_map("R", "refresh")
  tree_map(".", "toggle_dotfiles")
  tree_map(",", "toggle_ignored")
  tree_map("<", "prev_sibling")
  tree_map(">", "next_sibling")
  tree_map("<BS>", "close_node")
  tree_map(";", "preview")
  tree_map("<leader>s", "vsplit")
  tree_map("<leader>h", "vsplit")
  tree_map("<leader>t", "split")
  tree_map("<leader>n", "split")
end

vim.cmd([[
  au Filetype NvimTree :lua create_nvim_tree_bindings()
]])
