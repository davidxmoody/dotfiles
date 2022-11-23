require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  -- General
  use "tpope/vim-repeat"
  use "tpope/vim-speeddating"
  use "tpope/vim-surround"
  use "tpope/vim-commentary"
  use "lambdalisue/suda.vim"
  use "bluz71/vim-nightfly-guicolors"

  -- Navigation
  use "justinmk/vim-sneak"
  use "easymotion/vim-easymotion"
  use "windwp/nvim-autopairs"
  use "mattn/emmet-vim"
  use "davidxmoody/vim-indent-object"
  use "SirVer/ultisnips"

  -- Git
  use "tpope/vim-fugitive"
  use "airblade/vim-gitgutter"

  -- Tmux
  use "christoomey/vim-tmux-navigator"

  -- File explorers
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use {"junegunn/fzf", run = "./install --bin"}
  use "junegunn/fzf.vim"
  use "ojroques/nvim-lspfuzzy"

  -- Language specific
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use "jparise/vim-graphql"

  -- Completion and linting
  use "neovim/nvim-lspconfig"
  use "hrsh7th/nvim-cmp"
  use "quangnguyen30192/cmp-nvim-ultisnips"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-buffer"
  use "sbdchd/neoformat"
end)

vim.g["sneak#absolute_dir"] = 1
vim.g["sneak#use_ic_scs"] = 1

vim.g["EasyMotion_smartcase"] = 1
vim.g["EasyMotion_do_mapping"] = 0
vim.g["EasyMotion_enter_jump_first"] = 1
vim.g["EasyMotion_space_jump_first"] = 1
vim.g["EasyMotion_use_upper"] = 1
vim.g["EasyMotion_keys"] = "TNSRHLDMGYCWFPBVUOAIE"

vim.g.gitgutter_map_keys = 0
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 100
vim.api.nvim_create_autocmd("CursorHold", {command = "checktime"})

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
