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
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" Navigation plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plug 'haya14busa/is.vim'

Plug 'justinmk/vim-sneak'
let g:sneak#absolute_dir = 1
let g:sneak#use_ic_scs = 1

" Editing plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plug 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1
let delimitMate_nesting_quotes = ['"',"'",'`']

Plug 'mattn/emmet-vim'
nnoremap <C-F> <Nop>
inoremap <C-F> <Nop>
xnoremap <C-F> <Nop>
let g:user_emmet_leader_key='<C-F>'

Plug 'michaeljsmith/vim-indent-object'

Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = '<C-T>'
let g:UltiSnipsJumpForwardTrigger = '<C-T>'
let g:UltiSnipsJumpBackwardTrigger = '<C-N>'

Plug 'sedm0784/vim-you-autocorrect'

" Git plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plug 'airblade/vim-gitgutter'
set updatetime=250
set signcolumn=yes
let g:gitgutter_diff_args = '-w'

Plug 'tpope/vim-fugitive'

" Tmux plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 1
nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-T> :TmuxNavigateDown<cr>
nnoremap <silent> <C-N> :TmuxNavigateUp<cr>
nnoremap <silent> <C-S> :TmuxNavigateRight<cr>

Plug 'jpalardy/vim-slime'
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane": ":.2"}
let g:slime_no_mappings = 1
let g:slime_dont_ask_default = 1

" FZF plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --bin'}
Plug 'junegunn/fzf.vim'
let g:fzf_commits_log_options = '--color --graph --pretty=tformat:"%Cred%h%Creset - %C(bold blue)%<(18)%an %C(yellow)%d%Creset %s %Cgreen(%ar)%Creset" --abbrev-commit'

" NERDTree plugin ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
let NERDTreeIgnore=['^node_modules$', '^npm-debug.log$', '^.git$']
let NERDTreeCaseSensitiveSort=1
let NERDTreeNaturalSort=1
let NERDTreeShowBookmarks=1

let NERDTreeMapActivateNode='h'
let NERDTreeMapPreview='H'
let NERDTreeMapOpenSplit='s'
let NERDTreeMapPreviewSplit='S'
let NERDTreeMapOpenVSplit='v'
let NERDTreeMapPreviewVSplit='V'
let NERDTreeMapJumpFirstChild='{'
let NERDTreeMapJumpLastChild='}'

" 'Disable' these by mapping to a key I don't use
let NERDTreeMapOpenInTab='X'
let NERDTreeMapOpenInTabSilent='X'

Plug 'Xuyuanp/nerdtree-git-plugin', {'on': ['NERDTreeToggle', 'NERDTreeFind']}

" Writing plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
let g:vim_markdown_folding_disabled=1
let g:markdown_no_default_key_mappings=1
let g:vim_markdown_frontmatter=1

Plug 'junegunn/goyo.vim'

" Language specific plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plug 'pangloss/vim-javascript'
let g:javascript_plugin_flow = 1

Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0

Plug 'moll/vim-node'
Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}
Plug 'elzr/vim-json', {'for': 'json'}
let g:vim_json_syntax_conceal = 0

Plug 'leafgarland/typescript-vim'

Plug 'jparise/vim-graphql', {'for': 'graphql'}

" Plug 'neovimhaskell/haskell-vim'
" Plug 'ElmCast/elm-vim'

" Completion and linting ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plug 'Valloric/YouCompleteMe', {'do': './install.py'}
let g:ycm_filetype_blacklist = {'md': 1, 'mkd': 1, 'markdown': 1, 'text': 1, 'gitcommit': 1}
let g:ycm_always_populate_location_list = 1

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_linters_explicit = 1
let g:ale_linters = {
\   'typescript': ['tslint'],
\   'graphql': ['gqlint', 'prettier'],
\   'markdown': ['markdownlint'],
\   'html': ['prettier'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'typescript': ['prettier', 'remove_trailing_lines', 'trim_whitespace'],
\   'html': ['prettier'],
\}
Plug 'w0rp/ale'

" End of plugin manager setup ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

call plug#end()
filetype plugin indent on
syntax on

" Miscellaneous config ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set ignorecase
set smartcase
set scrolloff=2
set sidescrolloff=1
set list
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set showbreak=↪\ 
set directory=~/.vim-swap,~/tmp,/var/tmp,/tmp,.
set clipboard=unnamedplus
set nojoinspaces
set number
set showcmd
set backupcopy=yes
set mouse=nv
set nowrap
set undofile
set lazyredraw

" Indenting
set tabstop=2
set softtabstop=2
set shiftwidth=0 " Use value of tabstop
set expandtab

" gf filename options
set suffixesadd=.ts,.tsx,.js,.jsx,.json,.coffee,.scss,.css

" Check for changes to file
au CursorHold * checktime

" Auto wrap comments
set formatoptions=rqn1j
set textwidth=79

" Highlighting ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

highlight link QuickFixLine Normal
set cursorline
highlight CursorLine cterm=underline
highlight NormalNC cterm=NONE ctermbg=236

" Status line ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

highlight CustomModifiedFlag ctermbg=5 ctermfg=White
highlight StatusLine ctermfg=White cterm=reverse
highlight StatusLineNC cterm=reverse

set statusline=
set statusline+=%<%f
set statusline+=\ %h%q%r
set statusline+=%#CustomModifiedFlag#%m%*
set statusline+=%=\ 
set statusline+=%03.(%c%)\ %07.(%l/%L%)
set statusline+=%(\ %y%)

" Command line helpers ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

cnoremap cd. lcd %:p:h
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
command Cppath let @+ = expand("%:p")
command Vimrc e ~/.config/nvim/init.vim

" Keybindings ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

map <space> <Nop>
let mapleader=' '

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
noremap <C-d> :q<CR>
noremap <leader>s <C-W>s
noremap <leader>v <C-W>v
noremap <leader>V ggVG
noremap <leader>w :set wrap!<CR>

nnoremap <leader>* :Ag! <C-R><C-W><CR>
xnoremap <leader>* "zy:Ag! <C-R><C-R>z<CR>
nnoremap * /\C\<<C-R><C-W>\><CR>
nnoremap g* /\C<C-R><C-W><CR>
xnoremap * "zy:Ag! <C-R><C-R>z<CR>

nnoremap <leader>r :%s/\<<C-R><C-W>\>/<C-R><C-W>/g<Left><Left>
xnoremap <leader>r "zy:%s/\<<C-R><C-R>z\>/<C-R><C-R>z/g<Left><Left>
nnoremap <leader>R :!ag -l '\b<C-R><C-W>\b' \| xargs -I@ sed -i 's/\b<C-R><C-W>\b//g; T; w /dev/stdout' @ \| wc -l \| sed 's/$/ lines changed\n\n/'<C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><Left><Left><Left><Left>
xnoremap <leader>R "zy:!ag -l '\b<C-R><C-W>\b' \| xargs -I@ sed -i 's/\b<C-R><C-W>\b//g; T; w /dev/stdout' @ \| wc -l \| sed 's/$/ lines changed\n\n/'<C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><C-Left><Left><Left><Left><Left>

xnoremap . :norm.<CR>
noremap <leader>. /\C+<CR>"_.

noremap <leader>/ :nohlsearch<CR>

noremap <leader>f :ALEFix<CR>

nnoremap gd :YcmCompleter GoTo<CR>
nnoremap gD :YcmCompleter GoToType<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
nnoremap gR :YcmCompleter RefactorRename 
nnoremap gs :YcmCompleter FixIt<CR>
nnoremap gS :YcmCompleter GetType<CR>
nnoremap gl :YcmCompleter Format<CR>
nnoremap gL :YcmCompleter OrganizeImports<CR>
nnoremap gm :YcmCompleter GetDoc<CR>

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

xmap <leader>p <Plug>SlimeRegionSend
nmap <leader>p <Plug>SlimeParagraphSend
nmap <leader>P <Plug>SlimeConfig

noremap <silent> <leader>t :NERDTreeToggle<CR>
noremap <silent> <leader>T :NERDTreeFind<CR>

map m <Plug>Sneak_s
map M <Plug>Sneak_S
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map l <Plug>Sneak_t
map L <Plug>Sneak_T
map ( <Plug>Sneak_,
map ) <Plug>Sneak_;

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
" nmap <silent> - <Plug>(ale_next_wrap)
" nmap <silent> _ <Plug>(ale_previous_wrap)

noremap <C-K> cl<CR><Esc>lf<Space>

noremap gp p`[V`]=
noremap gP P`[V`]=
xnoremap gp p`[V`]=
xnoremap gP P`[V`]=

xnoremap <leader>p "0p
xnoremap <leader>P "0P
noremap <leader>d "_d
noremap <leader>D "_D
xnoremap <leader>d "_d
xnoremap <leader>D "_D

noremap , A
noremap <CR> o

nnoremap Y y$

noremap t j
noremap n k
noremap s l

noremap T 15j
noremap N 15k
noremap H 0
noremap S $
onoremap H 0

noremap gt gj
noremap gn gk

noremap j n
noremap J N
noremap gj gn

noremap k J
noremap K gJ

" Exit terminal
tnoremap <Esc> <C-\><C-n>

" Quickfix window style ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

autocmd FileType qf setl wrap
autocmd FileType qf setl nonumber
autocmd FileType qf nnoremap <buffer> <Enter> <Enter>
autocmd FileType qf nnoremap <buffer> h <Enter><C-W><C-W>

" English text editing ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if filereadable(glob("~/sync/diary-data/vim/en.utf-8.add"))
  set spellfile=~/sync/diary-data/vim/en.utf-8.add
endif

func! WordProcessorMode()
  source ~/.vim_abbreviations

  EnableAutocorrect

  augroup auto_capitalize_sentences
    au!
    au InsertCharPre <buffer> if search('\v(%^|%^[1-7]{2}\s|[.!?]\_s+|\_^\s*\-\s|\_^#+\s|\_^title\:\s|\n\n)%#', 'bcnw') != 0 | let v:char = toupper(v:char) | endif
  augroup END
endfu

com! WP call WordProcessorMode()
noremap <leader>W :call WordProcessorMode()<CR>
au BufNewFile,BufRead diary-*.md call WordProcessorMode()
