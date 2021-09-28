local function map(mode, lhs, rhs, options)
  vim.api.nvim_set_keymap(mode, lhs, rhs, vim.tbl_extend("force", {
    noremap = true,
    silent = true,
  }, options or {}))
end

local function map_plug(mode, lhs, rhs)
  map(mode, lhs, rhs, {noremap = false})
end

-- Leader key

map("", "<Space>", "<Nop>")
vim.g.mapleader = " "

-- Dvorak navigation

map("", "t", "j")
map("", "n", "k")
map("", "s", "l")

map("", "T", "")
map("", "N", "")
map("", "H", "0")
map("", "S", "$")

map("", "gt", "gj")
map("", "gn", "gk")

map("i", "+", "<Right><Esc>")
map("v", "+", "<Esc><Esc>")
map("", "+", ":update<CR>")

-- Consistent text navigation

map("", "<M-B>", "b")
map("", "<M-F>", "w")

map("i", "<M-B>", "<S-Left>")
map("i", "<M-F>", "<S-Right>")
map("i", "<M-BS>", "<C-w>")
map("i", "<C-D>", "<Del>")

map("c", "<C-A>", "<Home>", {silent = false})
map("c", "<M-B>", "<S-Left>", {silent = false})
map("c", "<M-F>", "<S-Right>", {silent = false})
map("c", "<M-BS>", "<C-w>", {silent = false})
map("c", "<C-D>", "<Del>", {silent = false})

-- Joining

map("", "k", "J")
map("", "K", "gJ")

-- Undo/redo

map("", "U", "<C-R>")
map("", "<C-R>", "<Nop>")

-- Terminal

map("t", "<Esc>", "<C-\\><C-n>")

-- FZF

map("", "<leader>e", ":Files<CR>")
map("", "<leader>E", ":Buffers<CR>")
map("", "<leader>o", ":GFiles?<CR>")
map("", "<leader>a", ":Rg<space>", {silent = false})
map("", "<leader>A", ":Rg<space><Up><CR>")
map("", "<leader>i", ":Rg<space>/<C-R>=fnameescape(expand('%:t:r'))<CR><CR>")
map("", "<leader>B", ":History<CR>")

-- File navigation

map("", "<leader>u", "ZZ")
map("", "<leader>b", "<C-^>")
map("", "<C-d>", ":q<CR>")

map("", "-", ":NvimTreeFindFile<CR>")
map("", "g-", ":NvimTreeToggle<CR>")

-- Selection

map_plug("", "<leader>v", "Vii")
map("", "<leader>V", "ggVG")

-- Jumping

map_plug("", "o", "<Plug>(easymotion-overwin-f2)")
map_plug("", "O", "<Plug>(easymotion-overwin-f2)")
map_plug("", "f", "<Plug>Sneak_f")
map_plug("", "F", "<Plug>Sneak_F")
map_plug("", "l", "<Plug>Sneak_t")
map_plug("", "L", "<Plug>Sneak_T")
map_plug("", "(", "<Plug>Sneak_,")
map_plug("", ")", "<Plug>Sneak_;")

map("n", ";", "g;")

-- Search

map("", "j", "n")
map("", "J", "N")
map("", "gj", "gn")
map("", "gJ", "gN")

map("n", "*", "/\\C\\<<C-R><C-W>\\><CR>")
map("n", "<leader>*", ":Rg <C-R><C-W><CR>")
map("x", "*", "\"zy/<C-R><C-R>z<CR>")
map("x", "<leader>*", "\"zy:Rg <C-R><C-R>z<CR>")

map("n", "gx", "/export<CR>")

-- Entering insertion

map("", ",", "A")
map("", "<leader>,", "GA")
map("", "<CR>", "o")
map("", "g<CR>", "O")

-- Repeat pasting

map("x", "gp", "\"0p")
map("x", "gP", "\"0P")
map("n", "gp", "V\"0p")
map("n", "gP", "V\"0p")

-- Repeat operator

map("x", ".", ":norm.<CR>")
map_plug("", "<leader>.", "/\\C\\<\"\\><CR>.")

-- Window splitting

map("", "<leader>h", ":aboveleft vsplit<CR>")
map("", "<leader>t", ":belowright split<CR>")
map("", "<leader>n", ":aboveleft split<CR>")
map("", "<leader>s", ":belowright vsplit<CR>")

-- Tmux window navigation

map("n", "<C-H>", ":TmuxNavigateLeft<CR>")
map("n", "<C-T>", ":TmuxNavigateDown<CR>")
map("n", "<C-N>", ":TmuxNavigateUp<CR>")
map("n", "<C-S>", ":TmuxNavigateRight<CR>")

map("v", "<C-H>", "<Esc><Esc>:TmuxNavigateLeft<CR>")
map("v", "<C-T>", "<Esc><Esc>:TmuxNavigateDown<CR>")
map("v", "<C-N>", "<Esc><Esc>:TmuxNavigateUp<CR>")
map("v", "<C-S>", "<Esc><Esc>:TmuxNavigateRight<CR>")

map("i", "<C-H>", "<Right><Esc>:TmuxNavigateLeft<CR>")
map("i", "<C-T>", "<Right><Esc>:TmuxNavigateDown<CR>")
map("i", "<C-N>", "<Right><Esc>:TmuxNavigateUp<CR>")
map("i", "<C-S>", "<Right><Esc>:TmuxNavigateRight<CR>")

map("t", "<C-H>", "<C-\\><C-N>:TmuxNavigateLeft<CR>")
map("t", "<C-T>", "<C-\\><C-N>:TmuxNavigateDown<CR>")
map("t", "<C-N>", "<C-\\><C-N>:TmuxNavigateUp<CR>")
map("t", "<C-S>", "<C-\\><C-N>:TmuxNavigateRight<CR>")

map("c", "<C-H>", "<Nop>")
map("c", "<C-T>", "<Nop>")
map("c", "<C-N>", "<Nop>")
map("c", "<C-S>", "<Nop>")

-- Git

map("", "<leader>gb", ":Git blame<CR>")
map("", "<leader>gr", ":Gread<CR>")
map("", "<leader>gw", ":Gwrite<CR>")

map_plug("", "<leader>ga", "<Plug>(GitGutterStageHunk)")
map_plug("", "<leader>gu", "<Plug>(GitGutterUndoHunk)")
map_plug("", "]h", "<Plug>(GitGutterNextHunk)")
map_plug("", "[h", "<Plug>(GitGutterPrevHunk)")
map_plug("o", "ih", "<Plug>(GitGutterTextObjectInnerPending)")
map_plug("o", "ah", "<Plug>(GitGutterTextObjectOuterPending)")
map_plug("x", "ih", "<Plug>(GitGutterTextObjectInnerVisual)")
map_plug("x", "ah", "<Plug>(GitGutterTextObjectOuterVisual)")

-- Toggle settings

map("", "<leader>w", ":set wrap!<CR>")
map("", "<leader>W", ":set colorcolumn=80<CR>")
map("", "<leader>/", ":nohlsearch<CR>")

-- Slime

map_plug("x", "<leader>p", "<Plug>SlimeRegionSend")
map_plug("n", "<leader>p", "<Plug>SlimeParagraphSend")
map_plug("n", "<leader>P", "<Plug>SlimeConfig")

-- Refactoring

map("v", "<C-K>", [[:s/^\( *\)\([^:]\+\):.*$/\1"\2",/<CR>]])

map("n", "<C-K>", "cl<CR><Esc>lf<Space>")

map("", "ga", ":.Subvert/{true,false}/{false,true}/g<CR>:nohlsearch<CR>")

map("n", "<leader>r", [[:%s/\<<C-R><C-W>\>/<C-R><C-W>/g<Left><Left>]], { silent = false })
map("x", "<leader>r", [["zy:%s/\<<C-R><C-R>z\>/<C-R><C-R>z/g<Left><Left>]], { silent = false })

map("", "<leader>f", ":Neoformat<CR>")

map_plug("x", "<leader>x",
  [["lc<C-R>=substitute(system('node -p', @l), '\n\+$', '', '')<CR><ESC>]])

map("i", "<C-K>", "<C-R>=strftime(\"%F\")<CR>")

vim.cmd([[
  function! ExecuteMacroOverVisualRange()
    echo "@".getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
  endfunction
]])
map("x", "@", ":<C-u>call ExecuteMacroOverVisualRange()<CR>")

vim.cmd([[
  function! FillLine(str)
    .s/\s*$//
    let reps = (79 - col('$')) / len(a:str)
    if reps > 0
      .s/$/\=(' '.repeat(a:str, reps))/
    endif
  endfunction
]])
map("n", "<leader>~", ":call FillLine(\"~\")<CR>")
