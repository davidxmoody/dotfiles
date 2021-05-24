-- General plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim.cmd([[
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-speeddating'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'lambdalisue/suda.vim'
  Plug 'bluz71/vim-nightfly-guicolors'
]])

-- Navigation plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim.cmd([[
  Plug 'justinmk/vim-sneak'
]])

vim.g["sneak#absolute_dir"] = 1
vim.g["sneak#use_ic_scs"] = 1

vim.cmd([[
  Plug 'easymotion/vim-easymotion'
]])

vim.g["EasyMotion_smartcase"] = 1
vim.g["EasyMotion_do_mapping"] = 0
vim.g["EasyMotion_enter_jump_first"] = 1
vim.g["EasyMotion_space_jump_first"] = 1
vim.g["EasyMotion_use_upper"] = 1
vim.g["EasyMotion_keys"] = 'TNSRHLDMGYCWFPBVUOAIE'

-- Editing plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim.cmd([[
  Plug 'Raimondi/delimitMate'
]])

vim.g.delimitMate_expand_cr = 1
vim.g.delimitMate_nesting_quotes = {'"', "'", '`'}

vim.cmd([[
  Plug 'mattn/emmet-vim'
  nnoremap <C-F> <Nop>
  inoremap <C-F> <Nop>
  xnoremap <C-F> <Nop>
]])

vim.g.user_emmet_leader_key = '<C-F>'

vim.cmd([[
  Plug 'davidxmoody/vim-indent-object'
  Plug 'SirVer/ultisnips'
]])

vim.g.UltiSnipsExpandTrigger = '<C-F><C-F>'
vim.g.UltiSnipsJumpForwardTrigger = '<C-F><C-F>'
vim.g.UltiSnipsJumpBackwardTrigger = '<C-F><C-B>'

-- Git plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim.cmd([[
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  au CursorHold * checktime
  set updatetime=100
  set signcolumn=yes
  let g:gitgutter_map_keys = 0
]])


-- Tmux plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim.cmd([[
  Plug 'christoomey/vim-tmux-navigator'
]])

vim.g.tmux_navigator_no_mappings = 1
vim.g.tmux_navigator_disable_when_zoomed = 1

vim.cmd([[
  Plug 'jpalardy/vim-slime'
  let g:slime_target = "tmux"
  let g:slime_no_mappings = 1
  let g:slime_dont_ask_default = 1
  let g:slime_python_ipython = 1

  if !empty($TMUX)
    let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane": ":.2"}
  endif
]])

-- File explorers ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim.cmd([[
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'
]])

vim.g.nvim_tree_width = 32
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_add_trailing = 1

vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_ignore = {'.git', 'node_modules', '.DS_Store'}

vim.g.nvim_tree_disable_keybindings = 1

vim.cmd([[
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --bin'}
  Plug 'junegunn/fzf.vim'
]])

-- Language specific plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim.cmd([[
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'jparise/vim-graphql'
]])

-- Completion and linting ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

vim.cmd([[
  Plug 'neovim/nvim-lspconfig'

  Plug 'hrsh7th/nvim-compe'

  Plug 'sbdchd/neoformat'
]])

vim.g.shfmt_opt = '-i 2 -sr -ci'
vim.g.neoformat_typescript_prettier = {exe = './node_modules/.bin/prettier', args = {'--write', '--config .prettierrc'}, replace = 1}
vim.g.neoformat_typescriptreact_prettier = {exe = './node_modules/.bin/prettier', args = {'--write', '--config .prettierrc'}, replace = 1}
