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
Plug 'lifepillar/vim-solarized8'

" Navigation plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plug 'haya14busa/is.vim'

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

Plug 'sedm0784/vim-you-autocorrect'

" Git plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plug 'airblade/vim-gitgutter'
set updatetime=100
set signcolumn=yes
let g:gitgutter_map_keys = 0

Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" Tmux plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 1

nnoremap <silent> <C-H> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-T> :TmuxNavigateDown<CR>
nnoremap <silent> <C-N> :TmuxNavigateUp<CR>
nnoremap <silent> <C-S> :TmuxNavigateRight<CR>

vnoremap <silent> <C-H> <Esc><Esc>:TmuxNavigateLeft<CR>
vnoremap <silent> <C-T> <Esc><Esc>:TmuxNavigateDown<CR>
vnoremap <silent> <C-N> <Esc><Esc>:TmuxNavigateUp<CR>
vnoremap <silent> <C-S> <Esc><Esc>:TmuxNavigateRight<CR>

inoremap <silent> <C-H> <Right><Esc>:TmuxNavigateLeft<CR>
inoremap <silent> <C-T> <Right><Esc>:TmuxNavigateDown<CR>
inoremap <silent> <C-N> <Right><Esc>:TmuxNavigateUp<CR>
inoremap <silent> <C-S> <Right><Esc>:TmuxNavigateRight<CR>

tnoremap <silent> <C-H> <C-\><C-N>:TmuxNavigateLeft<CR>
tnoremap <silent> <C-T> <C-\><C-N>:TmuxNavigateDown<CR>
tnoremap <silent> <C-N> <C-\><C-N>:TmuxNavigateUp<CR>
tnoremap <silent> <C-S> <C-\><C-N>:TmuxNavigateRight<CR>

cnoremap <silent> <C-H> <Nop>
cnoremap <silent> <C-T> <Nop>
cnoremap <silent> <C-N> <Nop>
cnoremap <silent> <C-S> <Nop>

Plug 'jpalardy/vim-slime'
let g:slime_target = "tmux"
let g:slime_no_mappings = 1
let g:slime_dont_ask_default = 1
let g:slime_python_ipython = 1

if !empty($TMUX)
  let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane": ":.2"}
endif

" FZF plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --bin'}
Plug 'junegunn/fzf.vim'
let g:fzf_commits_log_options = '--color --graph --pretty=tformat:"%Cred%h%Creset - %C(bold blue)%<(18)%an %C(yellow)%d%Creset %s %Cgreen(%ar)%Creset" --abbrev-commit'
let g:fzf_layout = {'window': 'enew'}

" File explorers ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
" let NERDTreeIgnore=['^node_modules$', '^npm-debug.log$', '^.git$', '^build$', '^dist$']
" let NERDTreeCaseSensitiveSort=1
" let NERDTreeNaturalSort=1
" let NERDTreeAutoDeleteBuffer=1
" let NERDTreeMinimalUI=1
" let NERDTreeMinimalMenu=1

" let NERDTreeMapActivateNode='h'
" let NERDTreeMapPreview='H'
" let NERDTreeMapOpenSplit='s'
" let NERDTreeMapPreviewSplit='S'
" let NERDTreeMapOpenVSplit='v'
" let NERDTreeMapPreviewVSplit='V'
" let NERDTreeMapJumpFirstChild='{'
" let NERDTreeMapJumpLastChild='}'

" " 'Disable' these by mapping to a key I don't use
" let NERDTreeMapOpenInTab='X'
" let NERDTreeMapOpenInTabSilent='X'

" Plug 'Xuyuanp/nerdtree-git-plugin', {'on': ['NERDTreeToggle', 'NERDTreeFind']}

" TODO find a faster alternative to Defx

Plug 'Shougo/defx.nvim', {'do': ':UpdateRemotePlugins'}
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  nnoremap <silent><buffer><expr> c defx#do_action('copy')
  nnoremap <silent><buffer><expr> m defx#do_action('move')
  nnoremap <silent><buffer><expr> p defx#do_action('paste')
  nnoremap <silent><buffer><expr> d defx#do_action('remove')
  nnoremap <silent><buffer><expr> r defx#do_action('rename')

  nnoremap <silent><buffer><expr> <CR> defx#do_action('open')
  " nnoremap <silent><buffer><expr> s defx#do_action('open')
  " nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> - defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> i defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> ~ defx#do_action('cd')

  nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')

  nnoremap <silent><buffer><expr> k defx#do_action('new_file')
  nnoremap <silent><buffer><expr> K defx#do_action('new_directory')

  " nnoremap [c <Plug>(defx-git-prev)
  " nnoremap ]c <Plug>(defx-git-next)
  " nnoremap <buffer><silent> ]a <Plug>(defx-git-stage)
  " nnoremap <buffer><silent> ]r <Plug>(defx-git-reset)
  " nnoremap <buffer><silent> ]d <Plug>(defx-git-discard)

  " nnoremap <silent><buffer><expr> E defx#do_action('open', 'vsplit')
  " nnoremap <silent><buffer><expr> P defx#do_action('open', 'pedit')
  " nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
  " nnoremap <silent><buffer><expr> C defx#do_action('toggle_columns', 'git:icon:mark:indent:filename')
  " nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'time')
  " nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  " nnoremap <silent><buffer><expr> ; defx#do_action('repeat')
  " nnoremap <silent><buffer><expr> <C-D> defx#do_action('quit')
  " nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
  " nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
  " nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
  " nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
  " nnoremap <silent><buffer><expr> <C-l> defx#do_action('redraw')
  " nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
  " nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
endfunction

Plug 'kristijanhusak/defx-git'

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

" Completion and linting ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plug 'Valloric/YouCompleteMe', {'do': './install.py'}
let g:ycm_filetype_blacklist = {'markdown': 1, 'text': 1, 'gitcommit': 1, 'tsv': 1}
let g:ycm_always_populate_location_list = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_linters_explicit = 1
let g:ale_linters = {
\   'typescript': ['tslint'],
\   'graphql': ['prettier'],
\   'markdown': ['markdownlint'],
\   'html': ['prettier'],
\   'sh': ['shellcheck'],
\}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'typescript': ['prettier'],
\   'javascript': ['prettier'],
\   'json': ['prettier'],
\   'graphql': ['prettier'],
\   'html': ['prettier'],
\   'css': ['prettier'],
\   'vim': [],
\   'sh': ['shfmt'],
\}
let g:ale_sh_shellcheck_dialect='bash'
let g:ale_sh_shfmt_options='-i 2 -sr -ci'
Plug 'w0rp/ale'

" End of plugin manager setup ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

call plug#end()
filetype plugin indent on
syntax on

" Miscellaneous config ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

map <space> <Nop>
let mapleader=' '

set ignorecase
set smartcase
set scrolloff=2
set sidescrolloff=1
set list
set listchars=tab:→\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set showbreak=↪\ 
set directory=~/.vim-swap,~/t,/var/tmp,/tmp,.
set clipboard=unnamedplus
set nojoinspaces
set nonumber
set showcmd
set backupcopy=yes
set mouse=nv
set nowrap
set undofile
set lazyredraw
set hidden

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

autocmd bufnewfile,bufread *.tsx set filetype=typescript.tsx

" Colorscheme and highlighting ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set termguicolors
colorscheme solarized8
let g:solarized_term_italics = 1

set cursorline
highlight link QuickFixLine Normal

" For focused windows, use the 'default' background color (from tmux). This
" means the current Vim window will be highlighted only if the tmux pane that
" vim is running in is also currently active.
highlight Normal guibg=NONE
" Unfocused background color duplicated in tmux config
highlight NormalNC guibg=#001f28

" Status line ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

highlight CustomModifiedFlag guibg=Red guifg=White
highlight StatusLine guifg=White gui=reverse
highlight StatusLineNC gui=reverse

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

" Searching ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

nnoremap <leader>j :silent grep!<Space>
xnoremap <leader>j "zy:silent grep!<Space><C-R><C-R>z<CR>
nnoremap <silent> [j :cprevious<CR>
nnoremap <silent> ]j :cnext<CR>

autocmd QuickFixCmdPost [^l]* vertical belowright cwindow 120
autocmd QuickFixCmdPost l*    vertical belowright lwindow 120

" Keybindings ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

noremap <leader>u ZZ
noremap <leader>e :Files<CR>
noremap <leader>E :Buffers<CR>
noremap <leader>o :GFiles?<CR>
noremap <leader>a :Rg<space>
noremap <leader>A :Rg<space><Up><CR>
noremap <leader>i :Rg<space>/<C-R>=fnameescape(expand('%:t:r'))<CR><CR>
noremap <leader>b <C-^>
noremap <leader>B :History<CR>
noremap <C-d> :q<CR>

noremap <leader>h :aboveleft vsplit<CR>
noremap <leader>t :belowright split<CR>
noremap <leader>n :aboveleft split<CR>
noremap <leader>s :belowright vsplit<CR>

map <leader>v Vii
noremap <leader>V ggVG
noremap <leader>w :set wrap!<CR>
noremap <leader>W :set colorcolumn=80<CR>

" TODO add an alias to search for the selected text with bash gS alias

nnoremap         *  /\C\<<C-R><C-W>\><CR>
nnoremap         g* /<C-R><C-W>
nnoremap <leader>*  :Rg <C-R><C-W><CR>
nnoremap <leader>g* :Rg <C-R><C-W>

xnoremap         *  "zy/<C-R><C-R>z<CR>
xnoremap         g* "zy/<C-R><C-R>z
xnoremap <leader>*  "zy:Rg <C-R><C-R>z<CR>
xnoremap <leader>g* "zy:Rg <C-R><C-R>z

nnoremap <leader>r :%s/\<<C-R><C-W>\>/<C-R><C-W>/g<Left><Left>
xnoremap <leader>r "zy:%s/\<<C-R><C-R>z\>/<C-R><C-R>z/g<Left><Left>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

xnoremap . :norm.<CR>
map <leader>. /\C\<"\><CR>.

noremap <leader>, A,<CR>

noremap <leader>/ :nohlsearch<CR>

noremap ga :.Subvert/{true,false}/{false,true}/g<CR>:nohlsearch<CR>
noremap g, :.Subvert/[{ ,x}]/[{x, }]<CR>:nohlsearch<CR>

noremap <leader>f :ALEFix<CR>

nnoremap gd :YcmCompleter GoTo<CR>
nnoremap gD :YcmCompleter GoToType<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
nnoremap gR :YcmCompleter RefactorRename 
nnoremap gs :YcmCompleter FixIt<CR>
nnoremap gS :YcmShowDetailedDiagnostic<CR>
nnoremap gl :YcmCompleter GetType<CR>
nnoremap gL :YcmCompleter GetDoc<CR>

nnoremap gx /export<CR>

noremap <leader>gb :Gblame<CR>
noremap <leader>gr :Gread<CR>
noremap <leader>gw :Gwrite<CR>
noremap <leader>gs :Gbrowse<CR>

map <leader>ga <Plug>(GitGutterStageHunk)
map <leader>gu <Plug>(GitGutterUndoHunk)
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ah <Plug>(GitGutterTextObjectOuterPending)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)

xmap <leader>p <Plug>SlimeRegionSend
nmap <leader>p <Plug>SlimeParagraphSend
nmap <leader>P <Plug>SlimeConfig

xmap <leader>x "lc<C-R>=substitute(system('node -p', @l), '\n\+$', '', '')<CR><ESC>

" noremap <silent> <leader>m :NERDTreeFind<CR>
" noremap <silent> <leader>M :NERDTreeToggle<CR>

noremap <silent> - :Defx `expand('%:p:h')` -columns=mark:indent:git:icon:filename -search=`expand('%:p')`<CR>

map o <Plug>(easymotion-bd-f2)
map O <Plug>(easymotion-overwin-f2)
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map l <Plug>Sneak_t
map L <Plug>Sneak_T
map ( <Plug>Sneak_,
map ) <Plug>Sneak_;

inoremap + <Right><Esc>
vnoremap + <Esc><Esc>
noremap + :update<CR>
inoremap ! 
nnoremap ~ g~lw

function! FillLine(str)
  .s/\s*$//
  let reps = (79 - col('$')) / len(a:str)
  if reps > 0
    .s/$/\=(' '.repeat(a:str, reps))/
  endif
endfunction

nnoremap <leader>~ :call FillLine('~')<CR>

noremap _ :lfirst<CR>
noremap \| :lnext<CR>
" nmap <silent> - <Plug>(ale_next_wrap)
" nmap <silent> _ <Plug>(ale_previous_wrap)

noremap <C-K> cl<CR><Esc>lf<Space>

noremap gp p`[V`]=
noremap gP P`[V`]=
xnoremap gp p`[V`]=
xnoremap gP P`[V`]=

" TODO figure out how to paste/delete in a nice way without affecting the
" unnamed register
" xnoremap P "_p
" xnoremap P :<BS><BS><BS><BS><BS>let @p=@"<CR>"pp
" function! PasteWithoutYank()
"   let @p = @"
"   return '"pp'
" endfunction
" xnoremap <expr> P PasteWithoutYank()

xnoremap D "_d
xnoremap C "_c

noremap , A
noremap <CR> o
noremap g<CR> O

nnoremap Y y$

noremap t j
noremap n k
noremap s l

noremap T 
noremap N 
noremap H 0
noremap S $
onoremap H 0

noremap gt gj
noremap gn gk

noremap j n
noremap J N
noremap gj gn
noremap gJ gN

noremap k J
noremap K gJ

" Exit terminal
tnoremap <Esc> <C-\><C-n>

" Quickfix window style ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

autocmd FileType qf setl wrap
autocmd FileType qf setl nonumber
autocmd FileType qf nnoremap <buffer> <Enter> <Enter>

" English text editing ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if filereadable($VIM_SPELLFILE)
  set spellfile=$VIM_SPELLFILE
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

if empty($DISABLE_AUTO_WP_MODE)
  au BufNewFile,BufRead diary-*.md call WordProcessorMode()
endif

func! HideText()
  syntax off
  hi Normal guibg=#001f28 guifg=#103030
endfu

com HT call HideText()
