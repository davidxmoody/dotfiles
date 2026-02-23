local nxo = {"n", "x", "o"}
local builtin = require("telescope.builtin")

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

vim.keymap.set(nxo, "l", "t")
vim.keymap.set(nxo, "L", "T")

vim.keymap.set("i", "+", "<Right><Esc>")
vim.keymap.set({"x", "s"}, "+", "<Esc>")
vim.keymap.set("n", "+", ":update<CR>")

-- Consistent text navigation

vim.keymap.set({"i", "c"}, "<C-A>", "<Home>")
vim.keymap.set({"i", "c"}, "<C-E>", "<End>")
vim.keymap.set({"i", "c"}, "<M-b>", "<S-Left>")
vim.keymap.set({"i", "c"}, "<M-f>", "<S-Right>")
vim.keymap.set({"i", "c"}, "<M-BS>", "<C-w>")
vim.keymap.set({"i", "c"}, "<C-D>", "<Del>")

-- Joining

vim.keymap.set(nxo, "k", "J")
vim.keymap.set(nxo, "K", "gJ")

-- Undo/redo

vim.keymap.set(nxo, "U", "<C-R>")

-- Terminal

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- LSP

vim.keymap.set("n", "gd", builtin.lsp_definitions)
vim.keymap.set("n", "gD", builtin.lsp_type_definitions)
vim.keymap.set("n", "gl", vim.lsp.buf.hover)
vim.keymap.set("n", "gr", builtin.lsp_references)
vim.keymap.set("n", "gR", vim.lsp.buf.rename)
vim.keymap.set("n", "gs", vim.lsp.buf.code_action)
vim.keymap.set("n", "gS", vim.diagnostic.open_float)
vim.keymap.set("n", "_", function()
  vim.diagnostic.jump({count = 1})
end)

-- Telescope
vim.keymap.set(nxo, "<leader>e", builtin.find_files)
vim.keymap.set(nxo, "<leader>E", builtin.buffers)
vim.keymap.set(nxo, "<leader>o", builtin.git_status)
vim.keymap.set(nxo, "<leader>a", builtin.live_grep)
vim.keymap.set(nxo, "<leader>A", builtin.resume)
vim.keymap.set(nxo, "<leader>i", function()
  builtin.live_grep({default_text = "/" .. vim.fn.expand("%:t:r")})
end)
vim.keymap.set(nxo, "<leader>B", builtin.oldfiles)

-- File navigation

vim.keymap.set(nxo, "<leader>u", "ZZ")
vim.keymap.set(nxo, "<leader>b", "<C-^>")
vim.keymap.set(nxo, "<C-d>", ":q<CR>")

vim.keymap.set("n", "g-", ":NvimTreeToggle<CR>")

-- Zen mode

vim.keymap.set("n", "<leader>z", ":ZenMode<CR>", {silent = true})

-- Selection

vim.keymap.set("n", "<leader>v", function()
  local cur = vim.fn.line(".")
  local indent = vim.fn.indent(cur)
  if indent == 0 then
    return
  end
  local top, bot = cur, cur
  local last_line = vim.fn.line("$")
  while top > 1 and
    (vim.fn.indent(top - 1) >= indent or vim.fn.getline(top - 1):match("^%s*$")) do
    top = top - 1
  end
  while bot < last_line and
    (vim.fn.indent(bot + 1) >= indent or vim.fn.getline(bot + 1):match("^%s*$")) do
    bot = bot + 1
  end
  -- Trim blank lines from edges
  while top < bot and vim.fn.getline(top):match("^%s*$") do
    top = top + 1
  end
  while bot > top and vim.fn.getline(bot):match("^%s*$") do
    bot = bot - 1
  end
  vim.fn.cursor(top, 0)
  vim.cmd("normal! V")
  vim.fn.cursor(bot, 0)
end)

vim.keymap.set(nxo, "<leader>V", "ggVG")

-- Jumping

vim.keymap.set(nxo, "o", function()
  require("flash").jump()
end)
vim.keymap.set(nxo, "O", function()
  require("flash").treesitter()
end)

-- Search

vim.keymap.set(nxo, "j", "n")
vim.keymap.set(nxo, "J", "N")
vim.keymap.set(nxo, "gj", "gn")
vim.keymap.set(nxo, "gJ", "gN")

vim.keymap.set("n", "*", "/\\C\\<<C-R><C-W>\\><CR>")
vim.keymap.set("n", "<leader>*", function()
  builtin.grep_string({search = vim.fn.expand("<cword>")})
end)
local function get_visual_selection()
  return table.concat(vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos(".")))
end
vim.keymap.set("x", "*", function()
  vim.fn.search(get_visual_selection())
end)
vim.keymap.set("x", "<leader>*", function()
  builtin.grep_string({search = get_visual_selection()})
end)

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
  "<cmd>silent! .s/\\Ctrue\\|false/\\=submatch(0)=='true'?'false':'true'/g<CR><cmd>silent! .s/\\CTrue\\|False/\\=submatch(0)=='True'?'False':'True'/g<CR><cmd>nohlsearch<CR>",
  {silent = true})

vim.keymap.set(nxo, "<leader>f", function()
  require("conform").format()
end)

vim.keymap.set("x", "<leader>x", function()
  local text = get_visual_selection()
  local result = vim.fn.system({"node", "-p"}, text)
  result = result:gsub("\n+$", "")
  vim.cmd("normal! c" .. result)
end)

vim.keymap.set("x", "@", ":normal @", {remap = false})

-- Commands

vim.api.nvim_create_user_command("Cppath", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
end, {})

vim.api.nvim_create_user_command("Opdir", function()
  vim.fn.system({"open", vim.fn.expand("%:p:h")})
end, {})

vim.api.nvim_create_user_command("Opfile", function()
  vim.fn.system({"open", vim.fn.expand("%:p")})
end, {})

vim.api.nvim_create_user_command("Remove", function()
  os.remove(vim.fn.expand("%"))
  vim.cmd("bdelete!")
end, {})
