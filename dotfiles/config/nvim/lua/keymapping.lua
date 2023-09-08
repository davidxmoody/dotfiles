local nxo = {"n", "x", "o"}

vim.keymap.set(nxo, "<Space>", "<Nop>")

-- Dvorak navigation

vim.keymap.set(nxo, "t", "j")
vim.keymap.set(nxo, "n", "k")
vim.keymap.set(nxo, "s", "l")

vim.keymap.set(nxo, "T", "")
vim.keymap.set(nxo, "N", "")
vim.keymap.set(nxo, "H", "0")
vim.keymap.set({"n", "o"}, "S", "$")

vim.keymap.set(nxo, "gt", "gj")
vim.keymap.set(nxo, "gn", "gk")

vim.keymap.set("i", "+", "<Right><Esc>")
vim.keymap.set({"x", "s"}, "+", "<Esc>")
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

-- LSP

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.type_definition)
vim.keymap.set("n", "gl", vim.lsp.buf.hover)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "gR", vim.lsp.buf.rename)
vim.keymap.set("n", "gs", vim.lsp.buf.code_action)
vim.keymap.set("n", "gS", vim.diagnostic.open_float)
vim.keymap.set("n", "_", vim.diagnostic.goto_next)

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

vim.keymap.set(nxo, "o", "<Plug>(easymotion-overwin-f2)")
vim.keymap.set(nxo, "f", "<Plug>Sneak_f")
vim.keymap.set(nxo, "F", "<Plug>Sneak_F")
vim.keymap.set(nxo, "l", "<Plug>Sneak_t")
vim.keymap.set(nxo, "L", "<Plug>Sneak_T")
vim.keymap.set(nxo, "(", "<Plug>Sneak_,")
vim.keymap.set(nxo, ")", "<Plug>Sneak_;")

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

-- Expansion

vim.keymap.set(nxo, "<C-F>", "<Nop>")
vim.keymap.set(nxo, "<C-B>", "<Nop>")
vim.g.UltiSnipsExpandTrigger = "<C-F>"
vim.g.UltiSnipsJumpForwardTrigger = "<C-F>"
vim.g.UltiSnipsJumpBackwardTrigger = "<C-B>"

-- Window splitting

vim.keymap.set(nxo, "<leader>h", ":aboveleft vsplit<CR>")
vim.keymap.set(nxo, "<leader>t", ":belowright split<CR>")
vim.keymap.set(nxo, "<leader>n", ":aboveleft split<CR>")
vim.keymap.set(nxo, "<leader>s", ":belowright vsplit<CR>")

-- Tmux window navigation

vim.keymap.set("n", "<C-H>", ":TmuxNavigateLeft<CR>", {silent = true})
vim.keymap.set("n", "<C-T>", ":TmuxNavigateDown<CR>", {silent = true})
vim.keymap.set("n", "<C-N>", ":TmuxNavigateUp<CR>", {silent = true})
vim.keymap.set("n", "<C-S>", ":TmuxNavigateRight<CR>", {silent = true})

vim.keymap.set({"x", "s"}, "<C-H>", "<Esc>:TmuxNavigateLeft<CR>",
  {silent = true})
vim.keymap.set({"x", "s"}, "<C-T>", "<Esc>:TmuxNavigateDown<CR>",
  {silent = true})
vim.keymap.set({"x", "s"}, "<C-N>", "<Esc>:TmuxNavigateUp<CR>", {silent = true})
vim.keymap.set({"x", "s"}, "<C-S>", "<Esc>:TmuxNavigateRight<CR>",
  {silent = true})

vim.keymap.set("i", "<C-H>", "<Right><Esc>:TmuxNavigateLeft<CR>",
  {silent = true})
vim.keymap.set("i", "<C-T>", "<Right><Esc>:TmuxNavigateDown<CR>",
  {silent = true})
vim.keymap.set("i", "<C-N>", "<Right><Esc>:TmuxNavigateUp<CR>", {silent = true})
vim.keymap.set("i", "<C-S>", "<Right><Esc>:TmuxNavigateRight<CR>",
  {silent = true})

vim.keymap
  .set("t", "<C-H>", "<C-\\><C-N>:TmuxNavigateLeft<CR>", {silent = true})
vim.keymap
  .set("t", "<C-T>", "<C-\\><C-N>:TmuxNavigateDown<CR>", {silent = true})
vim.keymap.set("t", "<C-N>", "<C-\\><C-N>:TmuxNavigateUp<CR>", {silent = true})
vim.keymap.set("t", "<C-S>", "<C-\\><C-N>:TmuxNavigateRight<CR>",
  {silent = true})

vim.keymap.set("c", "<C-H>", "<Nop>")
vim.keymap.set("c", "<C-T>", "<Nop>")
vim.keymap.set("c", "<C-N>", "<Nop>")
vim.keymap.set("c", "<C-S>", "<Nop>")

-- Toggle settings

vim.keymap.set(nxo, "<leader>w", ":set wrap!<CR>")
vim.keymap.set(nxo, "<leader>W", ":set colorcolumn=80<CR>")
vim.keymap.set(nxo, "<leader>/", ":nohlsearch<CR>")

-- Refactoring

vim.keymap.set("v", "<C-K>", [[:s/^\( *\)\([^:]\+\):.*$/\1"\2",/<CR>]])

vim.keymap.set("n", "<C-K>", "cl<CR><Esc>lf<Space>")

vim.keymap.set(nxo, "ga",
  ":.s/true\\|false/\\=submatch(0)=='true'?'false':'true'/g<CR>:nohlsearch<CR>",
  {silent = true})

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

-- Commands

vim.api.nvim_create_user_command("Cppath", "let @+ = expand(\"%:p\")", {})

vim.api.nvim_create_user_command("Opdir",
  ":silent exec \"!open \" . fnameescape(expand(\"%:p:h\"))", {})

vim.api.nvim_create_user_command("Opfile",
  ":silent exec \"!open \" . fnameescape(expand(\"%:p\"))", {})

vim.api.nvim_create_user_command("Remove",
  "call delete(expand(\"%\")) | bdelete!", {})
