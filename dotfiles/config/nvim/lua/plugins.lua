-- Setup

vim.cmd('packadd paq-nvim')
local paq = require('paq-nvim').paq
paq({'savq/paq-nvim', opt = true})

-- General

paq('tpope/vim-repeat')
paq('tpope/vim-abolish')
paq('tpope/vim-speeddating')
paq('tpope/vim-surround')
paq('tpope/vim-commentary')
paq('lambdalisue/suda.vim')
paq('bluz71/vim-nightfly-guicolors')

-- Navigation

paq('justinmk/vim-sneak')
vim.g["sneak#absolute_dir"] = 1
vim.g["sneak#use_ic_scs"] = 1

paq('easymotion/vim-easymotion')
vim.g["EasyMotion_smartcase"] = 1
vim.g["EasyMotion_do_mapping"] = 0
vim.g["EasyMotion_enter_jump_first"] = 1
vim.g["EasyMotion_space_jump_first"] = 1
vim.g["EasyMotion_use_upper"] = 1
vim.g["EasyMotion_keys"] = 'TNSRHLDMGYCWFPBVUOAIE'

-- Editing

paq('Raimondi/delimitMate')
vim.g.delimitMate_expand_cr = 1
vim.g.delimitMate_nesting_quotes = {'"', "'", '`'}

paq('mattn/emmet-vim')
vim.cmd([[
  nnoremap <C-F> <Nop>
  inoremap <C-F> <Nop>
  xnoremap <C-F> <Nop>
]])
vim.g.user_emmet_leader_key = '<C-F>'

paq('davidxmoody/vim-indent-object')

paq('SirVer/ultisnips')
vim.g.UltiSnipsExpandTrigger = '<C-F><C-F>'
vim.g.UltiSnipsJumpForwardTrigger = '<C-F><C-F>'
vim.g.UltiSnipsJumpBackwardTrigger = '<C-F><C-B>'

-- Git

paq('tpope/vim-fugitive')

paq('airblade/vim-gitgutter')
vim.g.gitgutter_map_keys = 0
vim.cmd([[
  au CursorHold * checktime
  set updatetime=100
  set signcolumn=yes
]])

-- Tmux

paq('christoomey/vim-tmux-navigator')
vim.g.tmux_navigator_no_mappings = 1
vim.g.tmux_navigator_disable_when_zoomed = 1

paq('jpalardy/vim-slime')
vim.g.slime_target = "tmux"
vim.g.slime_no_mappings = 1
vim.g.slime_dont_ask_default = 1
vim.g.slime_python_ipython = 1
if (vim.env.TMUX) then
  vim.g.slime_default_config = {socket_name = vim.env.TMUX:gsub(',.*', ''), target_pane = ":.2"}
end

-- File explorers

paq('kyazdani42/nvim-web-devicons')
paq('kyazdani42/nvim-tree.lua')

vim.g.nvim_tree_width = 32
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_add_trailing = 1

vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_ignore = {'.git', 'node_modules', '.DS_Store'}

vim.g.nvim_tree_disable_keybindings = 1

paq('nvim-lua/popup.nvim')
paq('nvim-lua/plenary.nvim')
paq('nvim-telescope/telescope.nvim')

paq({'junegunn/fzf', run = './install --bin'})
paq('junegunn/fzf.vim')

-- Language specific

paq('nvim-treesitter/nvim-treesitter')

paq('jparise/vim-graphql')

-- Completion and linting

paq('neovim/nvim-lspconfig')

paq('hrsh7th/nvim-compe')

paq('sbdchd/neoformat')
vim.g.shfmt_opt = '-i 2 -sr -ci'
vim.g.neoformat_typescript_prettier = {exe = './node_modules/.bin/prettier', args = {'--write', '--config .prettierrc'}, replace = 1}
vim.g.neoformat_typescriptreact_prettier = {exe = './node_modules/.bin/prettier', args = {'--write', '--config .prettierrc'}, replace = 1}
