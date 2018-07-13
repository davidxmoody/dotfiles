" Setup plugin manager
if empty(glob("~/.config/nvim/autoload/plug.vim"))
  execute '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

filetype off
call plug#begin('~/.vim/plugged')

Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'SirVer/ultisnips'
Plug 'michaeljsmith/vim-indent-object'

Plug 'jpalardy/vim-slime'
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane": ":.2"}
let g:slime_no_mappings = 1
let g:slime_dont_ask_default = 1

Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 1
nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-T> :TmuxNavigateDown<cr>
nnoremap <silent> <C-N> :TmuxNavigateUp<cr>
nnoremap <silent> <C-S> :TmuxNavigateRight<cr>
" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

Plug 'airblade/vim-gitgutter'
set updatetime=250
set signcolumn=yes
let g:gitgutter_diff_args = '-w'

Plug 'pangloss/vim-javascript'
let g:javascript_plugin_flow = 1
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0
Plug 'moll/vim-node'
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'elzr/vim-json', { 'for': 'json' }
let g:vim_json_syntax_conceal = 0

Plug 'leafgarland/typescript-vim'

Plug 'justinmk/vim-sneak'
let g:sneak#absolute_dir = 1
let g:sneak#use_ic_scs = 1

Plug 'ElmCast/elm-vim'
Plug 'jparise/vim-graphql'

Plug 'neovimhaskell/haskell-vim'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
let g:fzf_commits_log_options = '--color --graph --pretty=tformat:"%Cred%h%Creset - %C(bold blue)%<(18)%an %C(yellow)%d%Creset %s %Cgreen(%ar)%Creset" --abbrev-commit'

" NERDTree
Plug 'scrooloose/nerdtree'
let NERDTreeMapActivateNode='h'
let NERDTreeIgnore=['^node_modules$', '^npm-debug.log$', '^.git$']
let NERDTreeCaseSensitiveSort=1
let NERDTreeNaturalSort=1
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

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'
let g:syntastic_typescript_checkers = ['tslint']

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
Plug 'plasticboy/vim-markdown'
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
set nowrap
set undofile

" Highlighting
set colorcolumn=80
highlight ColorColumn ctermbg=Black
highlight link QuickFixLine Normal
set cursorline
highlight CursorLine ctermbg=Black cterm=underline
" highlight CursorLine ctermbg=Black cterm=NONE
" autocmd InsertEnter * highlight CursorLine ctermbg=Red guifg=fg
" autocmd InsertLeave * highlight CursorLine ctermbg=Blue guifg=fg
" highlight Normal
highlight NormalNC cterm=NONE ctermbg=236

" Status line
set laststatus=2
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
highlight StatusLine ctermfg=White cterm=reverse
highlight StatusLineNC cterm=reverse

" Leader key
map <space> <Nop>
let mapleader=' '

" File movement
noremap <leader>u ZZ

noremap <leader>e :Files!<CR>
noremap <leader>E :Files!<space><C-R>=expand("%:p:h")<CR>

noremap <leader>o :GFiles!?<CR>
noremap <leader>O :Buffers!<CR>

noremap <leader>a :Ag!<space>
noremap <leader>A :Ag!<space><Up><CR>

noremap <leader>i :Ag!<space>/<C-R>=fnameescape(expand('%:t:r'))<CR><CR>

noremap <leader>c :cd<space><C-R>=fnameescape(expand("%:p:h"))<CR>
noremap <leader>C :cd <C-R>=fnameescape(systemlist('git rev-parse --show-toplevel')[0])<CR><CR>

noremap <leader>b <C-^>
noremap <leader>B :History!<CR>
" noremap <leader>q :q<CR>
" noremap <leader>Q :q!<CR>

noremap <C-b> :q<CR>
inoremap <C-b> <Esc>:q<CR>

" Window movement
noremap <leader>s <C-W>s
noremap <leader>v <C-W>v
" noremap <leader>w <C-W>w
" noremap <leader>W <C-W>W
noremap <leader>w <Nop>
noremap <leader>W <Nop>

" Search
nnoremap <leader>* :Ag! <C-R><C-W><CR>
vnoremap <leader>* "zy:Ag! <C-R><C-R>z<CR>
nnoremap * /\C\<<C-R><C-W>\><CR>
nnoremap g* /\C<C-R><C-W><CR>
vnoremap * "zy:Ag! <C-R><C-R>z<CR>

" Replace
nnoremap <leader>r :%s/\<<C-R><C-W>\>//g<Left><Left>
vnoremap <leader>r "zy:%s/\<<C-R><C-R>z\>//g<Left><Left>
nnoremap <leader>R :!ag -l '\b<C-R><C-W>\b' \| xargs -I@ sed -i 's/\b<C-R><C-W>\b//g; T; w /dev/stdout' @ \| wc -l \| sed 's/$/ lines changed\n\n/'<C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><Left><Left><Left><Left>
vnoremap <leader>R "zy:!ag -l '\b<C-R><C-W>\b' \| xargs -I@ sed -i 's/\b<C-R><C-W>\b//g; T; w /dev/stdout' @ \| wc -l \| sed 's/$/ lines changed\n\n/'<C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><Left><Left><Left><Left>

" TypeScript
nnoremap gd :YcmCompleter GoTo<CR>
nnoremap gD :YcmCompleter GoToType<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
nnoremap gR :YcmCompleter RefactorRename 
nnoremap gs :YcmCompleter FixIt<CR>
nnoremap gS :YcmCompleter GetType<CR>
nnoremap gl :YcmCompleter Format<CR>
nnoremap gL :YcmCompleter OrganizeImports<CR>
nnoremap gm :YcmCompleter GetDoc<CR>

" Quick hacky way to run prettier (should use ALE or other plugin instead)
nnoremap <leader>P :silent %!./node_modules/.bin/prettier --stdin --parser=typescript --config=./src/.prettierrc<CR>

" Quickfix/Location List window mappings
autocmd FileType qf setl wrap
autocmd FileType qf setl nonumber
autocmd FileType qf nnoremap <buffer> <Enter> <Enter>
autocmd FileType qf nnoremap <buffer> h <Enter><C-W><C-W>

" Git
noremap <leader>gb :Gblame<CR>
noremap <leader>gr :Gread<CR>
noremap <leader>gw :Gwrite<CR>
noremap <leader>gs :Gbrowse<CR>

noremap <leader>ha :GitGutterStageHunk<CR>
noremap <leader>hu :GitGutterUndoHunk<CR>
noremap <leader>hr <Nop>
noremap <leader>hv :GitGutterPreviewHunk<CR>
noremap <leader>ht :GitGutterToggle<CR>
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
omap ih <Plug>GitGutterTextObjectInnerPending
omap ah <Plug>GitGutterTextObjectOuterPending
xmap ih <Plug>GitGutterTextObjectInnerVisual
xmap ah <Plug>GitGutterTextObjectOuterVisual

" Vim Slime
xmap <leader>p <Plug>SlimeRegionSend
nmap <leader>p <Plug>SlimeParagraphSend
nmap <leader>P <Plug>SlimeConfig

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

" Navigation with htns
noremap t j
noremap n k
noremap s l

noremap T 
noremap N 
noremap H 0
noremap S $
onoremap H 0
" Conflicts with surround plugin
" onoremap S $

noremap gt gj
noremap gn gk
noremap gj gn

noremap k J
noremap l t

noremap K gJ
noremap L T

" Quick editing of this file
command Vimrc e ~/.config/nvim/init.vim

" gf filename options
set suffixesadd=.js,.json,.jsx,.coffee,.css,.scss,.ts,.tsx

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
  setl nocursorline
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

if filereadable(glob("~/sync/diary-data/vim/en.utf-8.add"))
  set spellfile=~/sync/diary-data/vim/en.utf-8.add
endif

com! WP call WordProcessorMode()
au BufNewFile,BufRead *.md call WordProcessorMode()
au BufNewFile,BufRead diary-*.txt call WordProcessorMode()

" These seem to be valid but mapping the '(' char breaks syntax highlighting
map m <Plug>Sneak_s
map M <Plug>Sneak_S
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map l <Plug>Sneak_t
map L <Plug>Sneak_T
map ) <Plug>Sneak_;
map ( <Plug>Sneak_,
