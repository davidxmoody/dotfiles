require "paq" {
  "savq/paq-nvim",

  -- General
  "tpope/vim-repeat",
  "tpope/vim-abolish",
  "tpope/vim-speeddating",
  "tpope/vim-surround",
  "tpope/vim-commentary",
  "lambdalisue/suda.vim",
  "bluz71/vim-nightfly-guicolors",

  -- Navigation
  "justinmk/vim-sneak",
  "easymotion/vim-easymotion",
  "windwp/nvim-autopairs",
  "mattn/emmet-vim",
  "davidxmoody/vim-indent-object",
  "SirVer/ultisnips",

  -- Git
  "tpope/vim-fugitive",
  "airblade/vim-gitgutter",

  -- Tmux
  "christoomey/vim-tmux-navigator",

  -- File explorers
  "kyazdani42/nvim-web-devicons",
  "kyazdani42/nvim-tree.lua",
  {"junegunn/fzf", run = "./install --bin"},
  "junegunn/fzf.vim",
  "ojroques/nvim-lspfuzzy",

  -- Language specific
  "nvim-treesitter/nvim-treesitter",
  "jparise/vim-graphql",

  -- Completion and linting
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",
  "quangnguyen30192/cmp-nvim-ultisnips",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-buffer",
  "sbdchd/neoformat",
}

vim.g["sneak#absolute_dir"] = 1
vim.g["sneak#use_ic_scs"] = 1

vim.g["EasyMotion_smartcase"] = 1
vim.g["EasyMotion_do_mapping"] = 0
vim.g["EasyMotion_enter_jump_first"] = 1
vim.g["EasyMotion_space_jump_first"] = 1
vim.g["EasyMotion_use_upper"] = 1
vim.g["EasyMotion_keys"] = "TNSRHLDMGYCWFPBVUOAIE"

vim.g.gitgutter_map_keys = 0
vim.cmd([[
  au CursorHold * checktime
  set updatetime=100
  set signcolumn=yes
]])

vim.g.tmux_navigator_no_mappings = 1
vim.g.tmux_navigator_disable_when_zoomed = 1

vim.g.shfmt_opt = "-i 2 -sr -ci"
vim.g.neoformat_typescript_prettier = {
  exe = "./node_modules/.bin/prettier",
  args = {"--write", "--config .prettierrc"},
  replace = 1,
}
vim.g.neoformat_typescriptreact_prettier = {
  exe = "./node_modules/.bin/prettier",
  args = {"--write", "--config .prettierrc"},
  replace = 1,
}
