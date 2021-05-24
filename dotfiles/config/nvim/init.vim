" Setup plugin manager ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if empty(glob("~/.config/nvim/autoload/plug.vim"))
  execute '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

filetype off
call plug#begin('~/.vim/plugged')

" General plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'lambdalisue/suda.vim'
Plug 'bluz71/vim-nightfly-guicolors'

" Navigation plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plug 'justinmk/vim-sneak'
let g:sneak#absolute_dir = 1
let g:sneak#use_ic_scs = 1

Plug 'easymotion/vim-easymotion'
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'TNSRHLDMGYCWFPBVUOAIE'

" Editing plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plug 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1
let delimitMate_nesting_quotes = ['"',"'",'`']

Plug 'mattn/emmet-vim'
nnoremap <C-F> <Nop>
inoremap <C-F> <Nop>
xnoremap <C-F> <Nop>
let g:user_emmet_leader_key='<C-F>'

Plug 'davidxmoody/vim-indent-object'

Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = '<C-F><C-F>'
let g:UltiSnipsJumpForwardTrigger = '<C-F><C-F>'
let g:UltiSnipsJumpBackwardTrigger = '<C-F><C-B>'

" Git plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plug 'airblade/vim-gitgutter'
set updatetime=100
au CursorHold * checktime
set signcolumn=yes
let g:gitgutter_map_keys = 0

Plug 'tpope/vim-fugitive'

" Tmux plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 1

Plug 'jpalardy/vim-slime'
let g:slime_target = "tmux"
let g:slime_no_mappings = 1
let g:slime_dont_ask_default = 1
let g:slime_python_ipython = 1

if !empty($TMUX)
  let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane": ":.2"}
endif

" File explorers ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

let g:nvim_tree_width = 32
let g:nvim_tree_follow = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_add_trailing = 1

let g:nvim_tree_hide_dotfiles = 1
let g:nvim_tree_gitignore = 1
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.DS_Store' ]

" let g:nvim_tree_lsp_diagnostics = 1
let nvim_tree_disable_keybindings = 1

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --bin'}
Plug 'junegunn/fzf.vim'

" Language specific plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'jparise/vim-graphql'

" Completion and linting ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" TODO list for lsp/completion:
" - Show messages and/or error counts in status line
" - Try out other lsp go to commands (implementation maybe?)
" - Try out better quickfix list navigation and maybe use that instead of telescope
" - Get eslint/tslint working (also shellcheck and maybe markdownlint)

Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/nvim-compe'

Plug 'sbdchd/neoformat'
let g:shfmt_opt='-i 2 -sr -ci'
let g:neoformat_typescript_prettier = {'exe': './node_modules/.bin/prettier', 'args': ['--write', '--config .prettierrc'], 'replace': 1}
let g:neoformat_typescriptreact_prettier = {'exe': './node_modules/.bin/prettier', 'args': ['--write', '--config .prettierrc'], 'replace': 1}

" End of plugin manager setup ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

call plug#end()
filetype plugin indent on
syntax on

" Text editing helper functions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! FillLine(str)
  .s/\s*$//
  let reps = (79 - col('$')) / len(a:str)
  if reps > 0
    .s/$/\=(' '.repeat(a:str, reps))/
  endif
endfunction
nnoremap <leader>~ :call FillLine('~')<CR>

" Lua requires ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

lua require('options')
lua require('lsp')
lua require('completion')
lua require('keymapping')
lua require('colorscheme')
lua require('commands')
lua require('statusline')

" English text editing ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if filereadable($VIM_SPELLFILE)
  set spellfile=$VIM_SPELLFILE
endif

func! WordProcessorMode()
  source ~/.vim_abbreviations

  augroup auto_capitalize_sentences
    au!
    au InsertCharPre <buffer> if search('\v(%^|%^[1-7]{2}\s|[.!?]\_s+|\_^\s*\-\s|\_^#+\s|\_^title\:\s|\n\n)%#', 'bcnw') != 0 | let v:char = toupper(v:char) | endif
  augroup END
endfu

com! WP call WordProcessorMode()

au BufNewFile,BufRead diary-*.md call WordProcessorMode()
