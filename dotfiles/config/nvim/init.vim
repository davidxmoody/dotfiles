" Setup plugin manager
if empty(glob("~/.config/nvim/autoload/plug.vim"))
  execute '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

filetype off
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0

Plug 'mbbill/undotree'
Plug 'mustache/vim-mustache-handlebars'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'mtscout6/vim-cjsx', { 'for': 'coffee' }
Plug 'elzr/vim-json', { 'for': 'json' }
let g:vim_json_syntax_conceal = 0

Plug 'terryma/vim-multiple-cursors'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdtree'

Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
map <leader>f :call OpenRanger()<CR>

" Syntastic
Plug 'scrooloose/syntastic'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_json_checkers = ['jsonlint']
au! BufRead,BufNewFile *.json set filetype=json

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Search highlighting
Plug 'haya14busa/incsearch.vim'
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map j  <Plug>(incsearch-nohl-n)
map J  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map g* <Plug>(incsearch-nohl-g*)
map #  <Nop>
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
let g:ycm_filetype_blacklist = { 'md': 1, 'mkd': 1, 'markdown': 1, 'text': 1 , 'gitcommit': 1 }
let g:UltiSnipsExpandTrigger = '<C-T>'
let g:UltiSnipsJumpForwardTrigger = '<C-T>'
let g:UltiSnipsJumpBackwardTrigger = '<C-N>'

" Bracket expansion
Plug 'Raimondi/delimitMate'
set backspace=indent,eol,start
let delimitMate_expand_cr = 1
let delimitMate_nesting_quotes = ['"',"'",'`']

" Emmet for expanding html stuff
Plug 'mattn/emmet-vim'
nnoremap <C-F> <Nop>
inoremap <C-F> <Nop>
vnoremap <C-F> <Nop>
let g:user_emmet_leader_key='<C-F>'

" Markdown syntax highlighting
Plug 'plasticboy/vim-markdown', { 'for': 'md' }
let g:vim_markdown_folding_disabled=1
let g:markdown_no_default_key_mappings=1
let g:vim_markdown_frontmatter=1

" Splitjoin
Plug 'AndrewRadev/splitjoin.vim'

" End of plugin manager setup
call plug#end()
filetype plugin indent on
syntax on

" Open new files in insert mode
"au BufNewFile * startinsert

" Miscellaneous 
set ruler
set autoread
set ignorecase
set smartcase
set report=0
set scrolloff=4
set sidescrolloff=1
set listchars=extends:>,precedes:<
set directory=~/.vim-swap,~/tmp,/var/tmp,/tmp,.
set clipboard=unnamedplus
set nojoinspaces
set number
set showcmd

" Status line
set laststatus=2
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}

" Leader key
map <space> <Nop>
let mapleader=' '

noremap <leader>u ZZ
noremap <leader>e :update<CR>:Files!<CR>
noremap <leader>E :update<CR>:Files!<space><C-R>=expand("%:p:h")<CR>
noremap <leader>a :update<CR>:Ag!<space>
noremap <leader>b <C-^>
noremap <leader>B :update<CR>:History!<CR>!term://<space>
noremap <leader>q :q<CR>
noremap <leader>Q :q!<CR>

noremap <leader>s <C-W>s
noremap <leader>v <C-W>v
noremap <leader>w <C-W>w

" '.' in visual mode repeats the last change on every line
vnoremap . :norm.<CR>

" Auto wrap comments
set textwidth=79
set formatoptions=crqn1j

" New way to exit normal mode
nmap + <Nop>
imap + <Esc>s
vmap + <Esc><Esc>
imap  <Nop>

nnoremap ; :

noremap + :update<CR>

imap  <Nop>
inoremap ! 

noremap _ :lfirst<CR>
noremap \| :lnext<CR>

" Some custom navigation bindings
noremap , A
noremap <CR> o
noremap - o-<Space>

noremap M <Nop>
noremap S <Nop>
noremap H <Nop>

" Indenting
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent

" No wrapping
set nowrap

" Navigation with htns
" TODO: remap these keys with the onoremap command too
noremap t j
noremap n k
noremap s l

noremap T 
noremap N 
noremap S L

noremap gt gj
noremap gn gk

noremap k J
noremap l t

noremap K gJ
noremap L T

" Custom indent select script
function! SelectIndent ()
  let temp_var=indent(line("."))
  while indent(line(".")-1) >= temp_var
    exe "normal! k"
  endwhile
  exe "normal! V"
  while indent(line(".")+1) >= temp_var
    exe "normal! j"
  endwhile
endfun
nmap gv :call SelectIndent()<CR>

" Paste stuff with correct indentation
nnoremap p p=`]
nnoremap P P=`]

" Quick editing of this file
command Vimrc e ~/.config/nvim/init.vim

" gf filename options
set suffixesadd=.js,.json,.coffee,.jsx,.cjsx,.yml,.yaml,.scss,.css

" Function for editing Python code
func! PythonMode()
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
endfu
au BufNewFile,BufRead *.py call PythonMode()

" Disable syntastic for cjsx (but not regular coffee files)
func! DisableSyntastic()
  set cmdheight=2
  SyntasticToggleMode
  set cmdheight=1
endfu
au BufNewFile,BufRead *.cjsx call DisableSyntastic()

set spellfile=~/sync/diary-data/vim/en.utf-8.add

" Function for editing English text
func! WordProcessorMode()
  " Load Markdown syntax highlighting but with custom hashtag support
  set filetype=md
  syn match htmlBoldItalic "#[-_a-zA-Z0-9]\+"

  " Other options
  set nonumber
  set wrap
  set linebreak
  set breakat=\ 
  set display=lastline
  set formatoptions=
  set spell spelllang=en_gb
  source ~/.vim_abbreviations

  " Indenting
  setl tabstop=4
  setl softtabstop=0
  setl shiftwidth=4
  setl expandtab
  setl nosmarttab
  setl noautoindent
  setl nocindent
  setl nosmartindent
  setl indentexpr=

  " Auto-capitalize script
  augroup SENTENCES
    au!
    autocmd InsertCharPre * if search('\v(%^|%^[1-7]{2}\s|[.!?]\_s+|\_^\s*\-\s|\_^#+\s|\_^title\:\s|\n\n)%#', 'bcnw') != 0 | let v:char = toupper(v:char) | endif
  augroup END
endfu

com! WP call WordProcessorMode()
au BufNewFile,BufRead *.md call WordProcessorMode()
au BufNewFile,BufRead diary-*.txt call WordProcessorMode()
