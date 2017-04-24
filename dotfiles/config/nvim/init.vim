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

Plug 'tommcdo/vim-fubitive'

" Unfortunately this plugin makes fzf glitchy and I value fzf more...
" Plug 'airblade/vim-gitgutter'
" set updatetime=250
" let g:gitgutter_diff_args = '-w'
" let g:gitgutter_sign_column_always = 1
" noremap <leader>ha <Plug>GitGutterStageHunk
" noremap <leader>hr <Plug>GitGutterUndoHunk
" noremap <leader>hv <Plug>GitGutterPreviewHunk
" noremap <leader>ht :GitGutterToggle<CR>
" nmap ]h <Plug>GitGutterNextHunk
" nmap [h <Plug>GitGutterPrevHunk
" omap ih <Plug>GitGutterTextObjectInnerPending
" omap ah <Plug>GitGutterTextObjectOuterPending
" xmap ih <Plug>GitGutterTextObjectInnerVisual
" xmap ah <Plug>GitGutterTextObjectOuterVisual

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0
Plug 'moll/vim-node'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'elzr/vim-json', { 'for': 'json' }
let g:vim_json_syntax_conceal = 0

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
let g:fzf_commits_log_options = '--color --graph --pretty=tformat:"%Cred%h%Creset - %C(bold blue)%<(18)%an %C(yellow)%d%Creset %s %Cgreen(%ar)%Creset" --abbrev-commit'

" NERDTree
Plug 'scrooloose/nerdtree'
let NERDTreeMapActivateNode='h'
let NERDTreeIgnore=['^node_modules$', '^npm-debug.log$', '^.git$']
let NERDTreeCaseSensitiveSort=1
let NERDTreeMapOpenInTab='X'
let NERDTreeShowBookmarks=1

Plug 'Xuyuanp/nerdtree-git-plugin'
let g:NERDTreeIndicatorMapCustom = {
  \ "Modified"  : "✹",
  \ "Staged"    : "✚",
  \ "Untracked" : "✭",
  \ "Renamed"   : "➜",
  \ "Unmerged"  : "═",
  \ "Deleted"   : "✖",
  \ "Dirty"     : "✗",
  \ "Clean"     : "✔︎",
  \ "Unknown"   : "?"
  \ }

" Syntastic
Plug 'scrooloose/syntastic'
let g:syntastic_aggregate_errors = 1

" Default JavaScript
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'

" TypeScript
let g:syntastic_typescript_checkers = ['tslint', 'tsc']

" Flow and eslint
" let g:syntastic_javascript_checkers = ['eslint', 'flow']
" let g:syntastic_javascript_eslint_exec = 'eslint_d'
" let g:syntastic_javascript_flow_exe = 'flow'
" let g:javascript_plugin_flow = 1

let g:syntastic_json_checkers = ['jsonlint']
au! BufRead,BufNewFile *.json set filetype=json

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Search highlighting
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map j  <Plug>(incsearch-nohl-n)
map J  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map g* <Plug>(incsearch-nohl-g*)
map #  <Nop>
" map /  <Plug>(incsearch-forward)
" map ?  <Plug>(incsearch-backward)
" map g/ <Plug>(incsearch-stay)
map / <Plug>(incsearch-fuzzy-/)
map ? <Plug>(incsearch-fuzzy-?)
map g/ <Plug>(incsearch-fuzzy-stay)
" TODO use <CTRL-R>/ to get access to the last search term to replace it

" Snippets
Plug 'SirVer/ultisnips'

" Completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
let g:ycm_filetype_blacklist = { 'md': 1, 'mkd': 1, 'markdown': 1, 'text': 1 , 'gitcommit': 1 }
au FileType css setlocal omnifunc=csscomplete#CompleteCSS
au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

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

" End of plugin manager setup
call plug#end()
filetype plugin indent on
syntax on

" Check for changes to file
au CursorHold * checktime

" Miscellaneous 
set ignorecase
set smartcase
set report=0
set scrolloff=2
set sidescrolloff=1
set list
set listchars=tab:›\ ,trail:•,extends:>,precedes:<,nbsp:.
set directory=~/.vim-swap,~/tmp,/var/tmp,/tmp,.
set clipboard=unnamedplus
set nojoinspaces
set number
set showcmd
set backupcopy=yes
set mouse=nv

" Persistent undo
set undofile
set undolevels=1000
set undoreload=10000

" Status line
set laststatus=2
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Leader key
map <space> <Nop>
let mapleader=' '

" File movement
noremap <leader>u ZZ

noremap <leader>e :update<CR>:Files!<CR>
noremap <leader>E :update<CR>:Files!<space><C-R>=expand("%:p:h")<CR>

noremap <leader>o :update<CR>:GFiles!?<CR>
noremap <leader>O :update<CR>:Buffers!<CR>

function Agdir(dir, ...)
  execute 'cd ' . a:dir
  execute 'Ag! ' . join(a:000, ' ')
  cd -
endfunction

command -nargs=+ Agdir call Agdir(<f-args>)

noremap <leader>a :update<CR>:Agdir<space>.<space>
noremap <leader>A :update<CR>:Agdir<space><C-R>=fnameescape(expand('%:h'))<CR><space>

noremap <leader>i :update<CR>:Ag!<space>/<C-R>=fnameescape(expand('%:t:r'))<CR><CR>

noremap <leader>c :Commits!<CR>
noremap <leader>C :BCommits!<CR>

noremap <leader>b <C-^>
noremap <leader>B :update<CR>:History!<CR>
noremap <leader>q :q<CR>
noremap <leader>Q :q!<CR>

" Window movement
noremap <leader>s <C-W>s
noremap <leader>v <C-W>v
noremap <leader>w <C-W>w
noremap <leader>W <C-W>W

" Search
nnoremap <leader>* :Ag! <C-R><C-W><CR>
vnoremap <leader>* "zy:Ag! <C-R><C-R>z<CR>
vnoremap * "zy:Ag! <C-R><C-R>z<CR>

" Replace
nnoremap <leader>r :%s/<C-R><C-W>//g<Left><Left>
vnoremap <leader>r "zy:%s/<C-R><C-R>z//g<Left><Left>
nnoremap <leader>R :!ag -l '<C-R><C-W>' \| xargs -I@ sed -i 's/<C-R><C-W>//g; T; w /dev/stdout' @ \| wc -l \| sed 's/$/ lines changed\n\n/'<C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><Left><Left><Left><Left>
vnoremap <leader>R "zy:!ag -l '<C-R><C-W>' \| xargs -I@ sed -i 's/<C-R><C-W>//g; T; w /dev/stdout' @ \| wc -l \| sed 's/$/ lines changed\n\n/'<C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><Left><Left><Left><Left>

" Git
noremap <leader>gb :Gblame<CR>
noremap <leader>gr :Gread<CR>
noremap <leader>gw :Gwrite<CR>
noremap <leader>gs :Gbrowse<CR>

" '.' in visual mode repeats the last change on every line
vnoremap . :norm.<CR>

" Auto wrap comments
set formatoptions=crqn1j
set textwidth=79
au FileType gitcommit set textwidth=72

" New way to exit normal mode
nmap + <Nop>
imap + <Esc>s
vmap + <Esc><Esc>
imap  <Nop>

noremap + :update<CR>

nnoremap ; :

imap  <Nop>
inoremap ! 

noremap _ :lfirst<CR>
noremap \| :lnext<CR>

noremap <C-K> cl<CR><Esc>lf<Space>

" Autoindent on paste
noremap gp p`[V`]=
noremap gP P`[V`]=
vnoremap gp p`[V`]=
vnoremap gP P`[V`]=

" Command line helpers
cnoremap cd. lcd %:p:h
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
command Cppath let @+ = expand("%:p")

" Some custom navigation bindings
noremap , A
noremap <CR> o
noremap - o-<Space>

nnoremap Y y$

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

" Quick editing of this file
command Vimrc e ~/.config/nvim/init.vim

" gf filename options
set suffixesadd=.js,.json,.jsx,.coffee,.css,.scss

noremap <silent> <leader>t :NERDTreeToggle<CR>
noremap <silent> <leader>T :NERDTreeFind<CR>
tnoremap <Esc> <C-\><C-n>

" Function for editing Python code
func! PythonMode()
  set tabstop=4
  set softtabstop=4
  set shiftwidth=4
endfu
au BufNewFile,BufRead *.py call PythonMode()

" Function for editing English text (everything should be local to buffer)
func! WordProcessorMode()
  setl filetype=markdown

  " Other options
  setl nonumber
  setl wrap
  setl linebreak
  setl breakat=\ 
  setl display=lastline
  setl formatoptions=
  setl spell spelllang=en_gb
  source ~/.vim_abbreviations

  " Indenting
  setl tabstop=2
  setl softtabstop=0
  setl shiftwidth=2
  setl expandtab
  setl nosmarttab
  setl noautoindent
  setl nocindent
  setl nosmartindent
  setl indentexpr=

  augroup auto_capitalize_sentences
    au!
    au InsertCharPre <buffer> if search('\v(%^|%^[1-7]{2}\s|[.!?]\_s+|\_^\s*\-\s|\_^#+\s|\_^title\:\s|\n\n)%#', 'bcnw') != 0 | let v:char = toupper(v:char) | endif
  augroup END
endfu

set spellfile=~/sync/diary-data/vim/en.utf-8.add

com! WP call WordProcessorMode()
au BufNewFile,BufRead *.md call WordProcessorMode()
