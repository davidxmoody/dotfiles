local nxo = {"n", "x", "o"}

vim.g.mapleader = " "
vim.keymap.set(nxo, "<Space>", "<Nop>")

-- Dvorak navigation

vim.keymap.set(nxo, "t", "j")
vim.keymap.set(nxo, "n", "k")
vim.keymap.set(nxo, "s", "l")

vim.keymap.set(nxo, "T", "")
vim.keymap.set(nxo, "N", "")
vim.keymap.set(nxo, "H", "0")
vim.keymap.set(nxo, "S", "$")

vim.keymap.set(nxo, "gt", "gj")
vim.keymap.set(nxo, "gn", "gk")

vim.keymap.set("i", "+", "<Right><Esc>")
vim.keymap.set("v", "+", "<Esc><Esc>")
vim.keymap.set("n", "+", ":update<CR>")

-- Consistent text navigation

vim.keymap.set(nxo, "<M-B>", "b")
vim.keymap.set(nxo, "<M-F>", "w")

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

vim.keymap.set(nxo, "k", "J")
vim.keymap.set(nxo, "K", "gJ")

-- Undo/redo

vim.keymap.set(nxo, "U", "<C-R>")

-- Terminal

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- FZF

vim.keymap.set(nxo, "<leader>e", ":Files<CR>")
vim.keymap.set(nxo, "<leader>E", ":Buffers<CR>")
vim.keymap.set(nxo, "<leader>o", ":GFiles?<CR>")
vim.keymap.set(nxo, "<leader>a", ":Rg<space>")
vim.keymap.set(nxo, "<leader>A", ":Rg<space><Up><CR>")
vim.keymap.set(nxo, "<leader>i",
  ":Rg<space>/<C-R>=fnameescape(expand('%:t:r'))<CR><CR>")
vim.keymap.set(nxo, "<leader>B", ":History<CR>")

-- File navigation

vim.keymap.set(nxo, "<leader>u", "ZZ")
vim.keymap.set(nxo, "<leader>b", "<C-^>")
vim.keymap.set(nxo, "<C-d>", ":q<CR>")

vim.keymap.set(nxo, "-", ":NvimTreeFindFile<CR>")
vim.keymap.set(nxo, "g-", ":NvimTreeToggle<CR>")

-- Selection

vim.keymap.set(nxo, "<leader>v", "Vii", {remap = true})
vim.keymap.set(nxo, "<leader>V", "ggVG")

-- Jumping

vim.keymap.set({"n", "x", "o"}, "o", "<Plug>(easymotion-overwin-f2)")
vim.keymap.set({"n", "x", "o"}, "f", "<Plug>Sneak_f")
vim.keymap.set({"n", "x", "o"}, "F", "<Plug>Sneak_F")
vim.keymap.set({"n", "x", "o"}, "l", "<Plug>Sneak_t")
vim.keymap.set({"n", "x", "o"}, "L", "<Plug>Sneak_T")
vim.keymap.set({"n", "x", "o"}, "(", "<Plug>Sneak_,")
vim.keymap.set({"n", "x", "o"}, ")", "<Plug>Sneak_;")

-- Search

vim.keymap.set(nxo, "j", "n")
vim.keymap.set(nxo, "J", "N")
vim.keymap.set(nxo, "gj", "gn")
vim.keymap.set(nxo, "gJ", "gN")

vim.keymap.set("n", "*", "/\\C\\<<C-R><C-W>\\><CR>")
vim.keymap.set("n", "<leader>*", ":Rg <C-R><C-W><CR>")
vim.keymap.set("x", "*", "\"zy/<C-R><C-R>z<CR>")
vim.keymap.set("x", "<leader>*", "\"zy:Rg <C-R><C-R>z<CR>")

vim.keymap.set("n", "gx", "/export<CR>")

-- Entering insertion

vim.keymap.set(nxo, ",", "A")
vim.keymap.set(nxo, "<leader>,", "GA")
vim.keymap.set(nxo, "<CR>", "o")
vim.keymap.set(nxo, "g<CR>", "O")

-- Repeat pasting

vim.keymap.set("x", "gp", "\"0p")
vim.keymap.set("x", "gP", "\"0P")
vim.keymap.set("n", "gp", "V\"0p")
vim.keymap.set("n", "gP", "V\"0p")

-- Repeat operator

vim.keymap.set("x", ".", ":norm.<CR>")
vim.keymap.set(nxo, "<leader>.", "/\\C\\<\"\\><CR>.")

-- Window splitting

vim.keymap.set(nxo, "<leader>h", ":aboveleft vsplit<CR>")
vim.keymap.set(nxo, "<leader>t", ":belowright split<CR>")
vim.keymap.set(nxo, "<leader>n", ":aboveleft split<CR>")
vim.keymap.set(nxo, "<leader>s", ":belowright vsplit<CR>")

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

vim.keymap.set(nxo, "<leader>gb", ":Git blame<CR>")
vim.keymap.set(nxo, "<leader>gr", ":Gread<CR>")
vim.keymap.set(nxo, "<leader>gw", ":Gwrite<CR>")

vim.keymap.set(nxo, "<leader>ga", "<Plug>(GitGutterStageHunk)")
vim.keymap.set(nxo, "<leader>gu", "<Plug>(GitGutterUndoHunk)")
vim.keymap.set(nxo, "]h", "<Plug>(GitGutterNextHunk)")
vim.keymap.set(nxo, "[h", "<Plug>(GitGutterPrevHunk)")
vim.keymap.set("o", "ih", "<Plug>(GitGutterTextObjectInnerPending)")
vim.keymap.set("o", "ah", "<Plug>(GitGutterTextObjectOuterPending)")
vim.keymap.set("x", "ih", "<Plug>(GitGutterTextObjectInnerVisual)")
vim.keymap.set("x", "ah", "<Plug>(GitGutterTextObjectOuterVisual)")

-- Toggle settings

vim.keymap.set(nxo, "<leader>w", ":set wrap!<CR>")
vim.keymap.set(nxo, "<leader>W", ":set colorcolumn=80<CR>")
vim.keymap.set(nxo, "<leader>/", ":nohlsearch<CR>")

-- Refactoring

vim.keymap.set("v", "<C-K>", [[:s/^\( *\)\([^:]\+\):.*$/\1"\2",/<CR>]])

vim.keymap.set("n", "<C-K>", "cl<CR><Esc>lf<Space>")

vim.keymap.set(nxo, "ga",
  ":.Subvert/{true,false}/{false,true}/g<CR>:nohlsearch<CR>")

vim.keymap
  .set("n", "<leader>r", [[:%s/\<<C-R><C-W>\>/<C-R><C-W>/g<Left><Left>]])

vim.keymap.set("x", "<leader>r",
  [["zy:%s/\<<C-R><C-R>z\>/<C-R><C-R>z/g<Left><Left>]])

vim.keymap.set(nxo, "<leader>f", ":Neoformat<CR>")

vim.keymap.set("x", "<leader>x",
  [["lc<C-R>=substitute(system('node -p', @l), '\n\+$', '', '')<CR><ESC>]])

vim.cmd([[
  function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
  endfunction
]])
vim.keymap.set("x", "@", ":<C-u>call ExecuteMacroOverVisualRange()<CR>")
