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

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Navigation plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

" Plug 'haya14busa/is.vim'

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
set signcolumn=yes
let g:gitgutter_map_keys = 0

Plug 'tpope/vim-fugitive'
" Plug 'junegunn/gv.vim'

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

" File explorers ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.DS_Store' ]
let g:nvim_tree_bindings = {
    \ 'edit':            ['<CR>', 'i'],
    \ 'edit_vsplit':     ['<leader>h', '<leader>s'],
    \ 'edit_split':      ['<leader>t', '<leader>n'],
    \ 'edit_tab':        [],
    \ 'toggle_ignored':  ';',
    \ 'toggle_dotfiles': '.',
    \ 'refresh':         'R',
    \ 'preview':         ',',
    \ 'cd':              'I',
    \ 'create':          'a',
    \ 'remove':          'd',
    \ 'rename':          'r',
    \ 'cut':             'x',
    \ 'copy':            'c',
    \ 'paste':           'p',
    \ 'prev_git_item':   'h',
    \ 'next_git_item':   's',
    \ }

noremap - :NvimTreeFindFile<CR>
noremap g- :NvimTreeToggle<CR>

" Language specific plugins ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Plug 'pangloss/vim-javascript'
let g:javascript_plugin_flow = 1

Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0

Plug 'moll/vim-node'
Plug 'elzr/vim-json', {'for': 'json'}
let g:vim_json_syntax_conceal = 0

" Plug 'leafgarland/typescript-vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'jparise/vim-graphql'

" Completion and linting ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

let g:coc_global_extensions = [
\ 'coc-tsserver',
\ 'coc-prettier',
\ 'coc-json']

Plug 'neoclide/coc.nvim', {'branch': 'release'}
set shortmess+=c
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()

" if exists('*complete_info')
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gR <Plug>(coc-rename)
nmap <silent> gl :call <SID>show_documentation()<CR>
nmap <silent> gs <Plug>(coc-codeaction-line)
nmap <silent> gS <Plug>(coc-fix-current)
nmap <silent> _ <Plug>(coc-diagnostic-next)
nmap <silent> \| <Plug>(coc-diagnostic-prev)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
"
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Plug 'Valloric/YouCompleteMe', {'do': './install.py'}
" let g:ycm_filetype_blacklist = {'markdown': 1, 'text': 1, 'gitcommit': 1, 'tsv': 1}
" let g:ycm_always_populate_location_list = 1
" let g:ycm_collect_identifiers_from_comments_and_strings = 1
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1

" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 0
" let g:ale_linters_explicit = 1
" let g:ale_linters = {
" \   'typescript': ['tslint', 'eslint'],
" \   'graphql': ['prettier'],
" \   'markdown': ['markdownlint'],
" \   'html': ['prettier'],
" \   'sh': ['shellcheck'],
" \}
" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'typescript': ['prettier'],
" \   'javascript': ['prettier'],
" \   'json': ['prettier'],
" \   'graphql': ['prettier'],
" \   'html': ['prettier'],
" \   'css': ['prettier'],
" \   'vim': [],
" \   'sh': ['shfmt'],
" \}
" let g:ale_sh_shellcheck_dialect='bash'
" let g:ale_sh_shfmt_options='-i 2 -sr -ci'
" Plug 'w0rp/ale'

" End of plugin manager setup ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

call plug#end()
filetype plugin indent on
syntax on

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"typescript", "tsx", "javascript", "graphql", "python", "regex", "jsdoc", "html", "bash", "json", "yaml", "css", "lua"},
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}
EOF

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

" Auto window resizing
set equalalways
autocmd VimResized * wincmd =

" Indenting
set tabstop=2
set softtabstop=2
set shiftwidth=0 " Use value of tabstop
set expandtab

" gf filename options
set suffixesadd=.ts,.tsx,.js,.jsx,.json,.coffee,.scss,.css

" Check for changes to file
" au CursorHold * checktime

" Auto wrap comments
set formatoptions=rqn1j
set textwidth=79

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
set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}\ 
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
command Opdir :silent exec "!open " . fnameescape(expand("%:p:h"))
command Opfile :silent exec "!open " . fnameescape(expand("%:p"))
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
noremap <leader>e <cmd>lua require('telescope.builtin').find_files()<cr>
noremap <leader>E <cmd>lua require('telescope.builtin').buffers()<cr>
noremap <leader>o <cmd>lua require('telescope.builtin').git_status()<cr>
noremap <leader>a <cmd>lua require('telescope.builtin').live_grep()<cr>
" noremap <leader>i :Rg!<space>/<C-R>=fnameescape(expand('%:t:r'))<CR><CR>
noremap <leader>b <C-^>
noremap <leader>B <cmd>lua require('telescope.builtin').oldfiles()<cr>
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
nnoremap <leader>* <cmd>lua require('telescope.builtin').grep_string()<cr>

xnoremap         *  "zy/<C-R><C-R>z<CR>
xnoremap         g* "zy/<C-R><C-R>z
" TODO
" xnoremap <leader>*  "zy:Rg! <C-R><C-R>z<CR>
" xnoremap <leader>g* "zy:Rg! <C-R><C-R>z

nnoremap <leader>r :%s/\<<C-R><C-W>\>/<C-R><C-W>/g<Left><Left>
xnoremap <leader>r "zy:%s/\<<C-R><C-R>z\>/<C-R><C-R>z/g<Left><Left>

nnoremap <leader>k Vc<C-R>=trim(system('date +%F -d "' . @" . '"'))<CR><Esc>
xnoremap <leader>k c<C-R>=trim(system('date +%F -d "' . @" . '"'))<CR><Esc>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

xnoremap . :norm.<CR>
map <leader>. /\C\<"\><CR>.

noremap <leader>, GA

noremap <leader>/ :nohlsearch<CR>

noremap ga :.Subvert/{true,false}/{false,true}/g<CR>:nohlsearch<CR>
noremap g, :.Subvert/[{ ,x}]/[{x, }]<CR>:nohlsearch<CR>

noremap <leader>f :CocCommand prettier.formatFile<CR>

" nnoremap gd :YcmCompleter GoTo<CR>
" nnoremap gD :YcmCompleter GoToType<CR>
" nnoremap gr :YcmCompleter GoToReferences<CR>
" nnoremap gR :YcmCompleter RefactorRename 
" nnoremap gs :YcmCompleter FixIt<CR>
" nnoremap gS :YcmShowDetailedDiagnostic<CR>
" nnoremap gl :YcmCompleter GetType<CR>
" nnoremap gL :YcmCompleter GetDoc<CR>

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

map o <Plug>(easymotion-overwin-f2)
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

noremap <C-K> cl<CR><Esc>lf<Space>

xnoremap gp "0p
xnoremap gP "0P
nnoremap gp V"0p
nnoremap gP V"0p

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

  augroup auto_capitalize_sentences
    au!
    au InsertCharPre <buffer> if search('\v(%^|%^[1-7]{2}\s|[.!?]\_s+|\_^\s*\-\s|\_^#+\s|\_^title\:\s|\n\n)%#', 'bcnw') != 0 | let v:char = toupper(v:char) | endif
  augroup END
endfu

com! WP call WordProcessorMode()

au BufNewFile,BufRead diary-*.md call WordProcessorMode()

func! HideText()
  syntax off
  hi Normal guibg=#001f28 guifg=#103030
endfu

com HT call HideText()
