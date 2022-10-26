-- Leader key

vim.g.mapleader = " "
vim.keymap.set("", "<Space>", "<Nop>")

-- Dvorak navigation

vim.keymap.set("", "t", "j")
vim.keymap.set("", "n", "k")
vim.keymap.set("", "s", "l")

vim.keymap.set("", "T", "")
vim.keymap.set("", "N", "")
vim.keymap.set("", "H", "0")
vim.keymap.set("", "S", "$")

vim.keymap.set("", "gt", "gj")
vim.keymap.set("", "gn", "gk")

vim.keymap.set("i", "+", "<Right><Esc>")
vim.keymap.set("v", "+", "<Esc><Esc>")
vim.keymap.set("", "+", ":update<CR>")

-- Consistent text navigation

vim.keymap.set("", "<M-B>", "b")
vim.keymap.set("", "<M-F>", "w")

vim.keymap.set("i", "<M-B>", "<S-Left>")
vim.keymap.set("i", "<M-F>", "<S-Right>")
vim.keymap.set("i", "<M-BS>", "<C-w>")
vim.keymap.set("i", "<C-D>", "<Del>")

vim.keymap.set("c", "<C-A>", "<Home>")
vim.keymap.set("c", "<M-B>", "<S-Left>")
vim.keymap.set("c", "<M-F>", "<S-Right>")
vim.keymap.set("c", "<M-BS>", "<C-w>")
vim.keymap.set("c", "<C-D>", "<Del>")

-- Joining

vim.keymap.set("", "k", "J")
vim.keymap.set("", "K", "gJ")

-- Undo/redo

vim.keymap.set("", "U", "<C-R>")
vim.keymap.set("", "<C-R>", "<Nop>")

-- Terminal

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- FZF

vim.keymap.set("", "<leader>e", ":Files<CR>")
vim.keymap.set("", "<leader>E", ":Buffers<CR>")
vim.keymap.set("", "<leader>o", ":GFiles?<CR>")
vim.keymap.set("", "<leader>a", ":Rg<space>")
vim.keymap.set("", "<leader>A", ":Rg<space><Up><CR>")
vim.keymap.set("", "<leader>i", ":Rg<space>/<C-R>=fnameescape(expand('%:t:r'))<CR><CR>")
vim.keymap.set("", "<leader>B", ":History<CR>")

-- File navigation

vim.keymap.set("", "<leader>u", "ZZ")
vim.keymap.set("", "<leader>b", "<C-^>")
vim.keymap.set("", "<C-d>", ":q<CR>")

vim.keymap.set("", "-", ":NvimTreeFindFile<CR>")
vim.keymap.set("", "g-", ":NvimTreeToggle<CR>")

-- Selection

vim.keymap.set("", "<leader>v", "Vii", {remap=true})
vim.keymap.set("", "<leader>V", "ggVG")

-- Jumping

vim.keymap.set("", "o", "<Plug>(easymotion-overwin-f2)")
vim.keymap.set("", "f", "<Plug>Sneak_f")
vim.keymap.set("", "F", "<Plug>Sneak_F")
vim.keymap.set("", "l", "<Plug>Sneak_t")
vim.keymap.set("", "L", "<Plug>Sneak_T")
vim.keymap.set("", "(", "<Plug>Sneak_,")
vim.keymap.set("", ")", "<Plug>Sneak_;")

vim.keymap.set("n", ";", "g;")

-- Search

vim.keymap.set("", "j", "n")
vim.keymap.set("", "J", "N")
vim.keymap.set("", "gj", "gn")
vim.keymap.set("", "gJ", "gN")

vim.keymap.set("n", "*", "/\\C\\<<C-R><C-W>\\><CR>")
vim.keymap.set("n", "<leader>*", ":Rg <C-R><C-W><CR>")
vim.keymap.set("x", "*", "\"zy/<C-R><C-R>z<CR>")
vim.keymap.set("x", "<leader>*", "\"zy:Rg <C-R><C-R>z<CR>")

vim.keymap.set("n", "gx", "/export<CR>")

-- Entering insertion

vim.keymap.set("", ",", "A")
vim.keymap.set("", "<leader>,", "GA")
vim.keymap.set("", "<CR>", "o")
vim.keymap.set("", "g<CR>", "O")

-- Repeat pasting

vim.keymap.set("x", "gp", "\"0p")
vim.keymap.set("x", "gP", "\"0P")
vim.keymap.set("n", "gp", "V\"0p")
vim.keymap.set("n", "gP", "V\"0p")

-- Repeat operator

vim.keymap.set("x", ".", ":norm.<CR>")
vim.keymap.set("", "<leader>.", "/\\C\\<\"\\><CR>.")

-- Window splitting

vim.keymap.set("", "<leader>h", ":aboveleft vsplit<CR>")
vim.keymap.set("", "<leader>t", ":belowright split<CR>")
vim.keymap.set("", "<leader>n", ":aboveleft split<CR>")
vim.keymap.set("", "<leader>s", ":belowright vsplit<CR>")

-- Tmux window navigation

vim.keymap.set("n", "<C-H>", ":TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-T>", ":TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-N>", ":TmuxNavigateUp<CR>")
vim.keymap.set("n", "<C-S>", ":TmuxNavigateRight<CR>")

vim.keymap.set("v", "<C-H>", "<Esc><Esc>:TmuxNavigateLeft<CR>")
vim.keymap.set("v", "<C-T>", "<Esc><Esc>:TmuxNavigateDown<CR>")
vim.keymap.set("v", "<C-N>", "<Esc><Esc>:TmuxNavigateUp<CR>")
vim.keymap.set("v", "<C-S>", "<Esc><Esc>:TmuxNavigateRight<CR>")

vim.keymap.set("i", "<C-H>", "<Right><Esc>:TmuxNavigateLeft<CR>")
vim.keymap.set("i", "<C-T>", "<Right><Esc>:TmuxNavigateDown<CR>")
vim.keymap.set("i", "<C-N>", "<Right><Esc>:TmuxNavigateUp<CR>")
vim.keymap.set("i", "<C-S>", "<Right><Esc>:TmuxNavigateRight<CR>")

vim.keymap.set("t", "<C-H>", "<C-\\><C-N>:TmuxNavigateLeft<CR>")
vim.keymap.set("t", "<C-T>", "<C-\\><C-N>:TmuxNavigateDown<CR>")
vim.keymap.set("t", "<C-N>", "<C-\\><C-N>:TmuxNavigateUp<CR>")
vim.keymap.set("t", "<C-S>", "<C-\\><C-N>:TmuxNavigateRight<CR>")

vim.keymap.set("c", "<C-H>", "<Nop>")
vim.keymap.set("c", "<C-T>", "<Nop>")
vim.keymap.set("c", "<C-N>", "<Nop>")
vim.keymap.set("c", "<C-S>", "<Nop>")

-- Git

vim.keymap.set("", "<leader>gb", ":Git blame<CR>")
vim.keymap.set("", "<leader>gr", ":Gread<CR>")
vim.keymap.set("", "<leader>gw", ":Gwrite<CR>")

vim.keymap.set("", "<leader>ga", "<Plug>(GitGutterStageHunk)")
vim.keymap.set("", "<leader>gu", "<Plug>(GitGutterUndoHunk)")
vim.keymap.set("", "]h", "<Plug>(GitGutterNextHunk)")
vim.keymap.set("", "[h", "<Plug>(GitGutterPrevHunk)")
vim.keymap.set("o", "ih", "<Plug>(GitGutterTextObjectInnerPending)")
vim.keymap.set("o", "ah", "<Plug>(GitGutterTextObjectOuterPending)")
vim.keymap.set("x", "ih", "<Plug>(GitGutterTextObjectInnerVisual)")
vim.keymap.set("x", "ah", "<Plug>(GitGutterTextObjectOuterVisual)")

-- Toggle settings

vim.keymap.set("", "<leader>w", ":set wrap!<CR>")
vim.keymap.set("", "<leader>W", ":set colorcolumn=80<CR>")
vim.keymap.set("", "<leader>/", ":nohlsearch<CR>")

-- Slime

vim.keymap.set("x", "<leader>p", "<Plug>SlimeRegionSend")
vim.keymap.set("n", "<leader>p", "<Plug>SlimeParagraphSend")
vim.keymap.set("n", "<leader>P", "<Plug>SlimeConfig")

-- Refactoring

vim.keymap.set("v", "<C-K>", [[:s/^\( *\)\([^:]\+\):.*$/\1"\2",/<CR>]])

vim.keymap.set("n", "<C-K>", "cl<CR><Esc>lf<Space>")

vim.keymap.set("", "ga", ":.Subvert/{true,false}/{false,true}/g<CR>:nohlsearch<CR>")

vim.keymap.set("n", "<leader>r", [[:%s/\<<C-R><C-W>\>/<C-R><C-W>/g<Left><Left>]])
vim.keymap.set("x", "<leader>r", [["zy:%s/\<<C-R><C-R>z\>/<C-R><C-R>z/g<Left><Left>]])

vim.keymap.set("", "<leader>f", ":Neoformat<CR>")

vim.keymap.set("x", "<leader>x",
  [["lc<C-R>=substitute(system('node -p', @l), '\n\+$', '', '')<CR><ESC>]])

vim.cmd([[
  function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
  endfunction
]])
vim.keymap.set("x", "@", ":<C-u>call ExecuteMacroOverVisualRange()<CR>")
