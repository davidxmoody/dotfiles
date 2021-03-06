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
set signcolumn=yes
let g:gitgutter_map_keys = 0

Plug 'tpope/vim-fugitive'

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
let g:nvim_tree_width = 32
let g:nvim_tree_hide_dotfiles = 1
let g:nvim_tree_follow = 1
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.DS_Store' ]
" let nvim_tree_disable_keybindings = 1

noremap - :NvimTreeFindFile<CR>
noremap g- :NvimTreeToggle<CR>

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --bin'}
Plug 'junegunn/fzf.vim'
" let g:fzf_layout = {'window': 'enew'}

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

Plug 'nvim-lua/completion-nvim'
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
set completeopt=menuone,noinsert,noselect
set shortmess+=c
imap <silent> <C-Space> <Plug>(completion_trigger)

Plug 'sbdchd/neoformat'
let g:shfmt_opt='-i 2 -sr -ci'
let g:neoformat_typescript_prettier = {'exe': './node_modules/.bin/prettier', 'args': ['--write', '--config .prettierrc'], 'replace': 1}
let g:neoformat_typescriptreact_prettier = {'exe': './node_modules/.bin/prettier', 'args': ['--write', '--config .prettierrc'], 'replace': 1}

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

lua <<EOF
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  require'completion'.on_attach()

  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }
  -- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'gl', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', opts)
  buf_set_keymap('n', 'gR', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gS', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', 'gs', '<cmd>lua require("telescope.builtin").lsp_code_actions()<CR>', opts)
  -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '_', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
end

local servers = {"tsserver"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF

" let g:nvim_tree_bindings = {
"     \ 'edit':            ['<CR>', 'i'],
"     \ 'edit_vsplit':     ['<leader>h', '<leader>s'],
"     \ 'edit_split':      ['<leader>t', '<leader>n'],
"     \ 'edit_tab':        [],
"     \ 'toggle_ignored':  ';',
"     \ 'toggle_dotfiles': '.',
"     \ 'refresh':         'R',
"     \ 'preview':         ',',
"     \ 'cd':              'I',
"     \ 'create':          'a',
"     \ 'remove':          'd',
"     \ 'rename':          'r',
"     \ 'cut':             'x',
"     \ 'copy':            'c',
"     \ 'paste':           'p',
"     \ 'prev_git_item':   'h',
"     \ 'next_git_item':   's',
"     \ }
lua <<EOF
local function get_lua_cb(cb_name)
  return string.format(":lua require'nvim-tree'.on_keypress('%s')<CR>", cb_name)
end

vim.g.nvim_tree_bindings = {
  ["<CR>"]           = get_lua_cb("edit"),
  ["o"]              = get_lua_cb("edit"),
  ["<2-LeftMouse>"]  = get_lua_cb("edit"),
  ["<2-RightMouse>"] = get_lua_cb("cd"),
  ["<C-]>"]          = get_lua_cb("cd"),
  ["<C-v>"]          = get_lua_cb("vsplit"),
  ["<C-x>"]          = get_lua_cb("split"),
  ["<C-t>"]          = get_lua_cb("tabnew"),
  ["<BS>"]           = get_lua_cb("close_node"),
  ["<S-CR>"]         = get_lua_cb("close_node"),
  ["<Tab>"]          = get_lua_cb("preview"),
  ["I"]              = get_lua_cb("toggle_ignored"),
  ["H"]              = get_lua_cb("toggle_dotfiles"),
  ["R"]              = get_lua_cb("refresh"),
  ["a"]              = get_lua_cb("create"),
  ["d"]              = get_lua_cb("remove"),
  ["r"]              = get_lua_cb("rename"),
  ["<C-r>"]          = get_lua_cb("full_rename"),
  ["x"]              = get_lua_cb("cut"),
  ["c"]              = get_lua_cb("copy"),
  ["p"]              = get_lua_cb("paste"),
  ["[c"]             = get_lua_cb("prev_git_item"),
  ["]c"]             = get_lua_cb("next_git_item"),
  ["-"]              = get_lua_cb("dir_up"),
  ["q"]              = get_lua_cb("close"),
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
au CursorHold * checktime

" Auto wrap comments
set formatoptions=rqn1j
set textwidth=79

" Allow lua syntax highlighting in vim files
let g:vimsyn_embed = 'l'

" Highlight on yank
au TextYankPost * lua vim.highlight.on_yank {}

" Colorscheme and highlighting ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set cursorline
set termguicolors

colorscheme nightfly
let g:nightflyCursorColor = 1
let g:nightflyUnderlineMatchParen = 1

hi Pmenu ctermfg=0 ctermbg=13 guifg=fg guibg=#1d3b53

" For focused windows, use the 'default' background color (from tmux). This
" means the current Vim window will be highlighted only if the tmux pane that
" vim is running in is also currently active.
highlight Normal guibg=NONE
" Unfocused background color duplicated in tmux config
highlight NormalNC guibg=#000a13

" Status line ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

highlight CustomModifiedFlag guibg=Red guifg=White
" highlight StatusLine guifg=White gui=reverse
" highlight StatusLineNC gui=reverse

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

" noremap <leader>e :Files!<CR>
" noremap <leader>E :Buffers!<CR>
" noremap <leader>o :GFiles!?<CR>
" noremap <leader>a :Rg!<space>
" noremap <leader>A :Rg!<space><Up><CR>
" noremap <leader>i :Rg!<space>/<C-R>=fnameescape(expand('%:t:r'))<CR><CR>
" noremap <leader>B :History!<CR>

noremap <leader>e :Files<CR>
noremap <leader>E :Buffers<CR>
noremap <leader>o :GFiles?<CR>
noremap <leader>a :Rg<space>
noremap <leader>A :Rg<space><Up><CR>
noremap <leader>i :Rg<space>/<C-R>=fnameescape(expand('%:t:r'))<CR><CR>
noremap <leader>B :History<CR>

noremap <leader>u ZZ
" noremap <leader>e <cmd>lua require('telescope.builtin').find_files()<cr>
" noremap <leader>E <cmd>lua require('telescope.builtin').buffers()<cr>
" noremap <leader>o <cmd>lua require('telescope.builtin').git_status()<cr>
" noremap <leader>a <cmd>lua require('telescope.builtin').live_grep()<cr>
" noremap <leader>i :Rg!<space>/<C-R>=fnameescape(expand('%:t:r'))<CR><CR>
noremap <leader>b <C-^>
" noremap <leader>B <cmd>lua require('telescope.builtin').oldfiles()<cr>
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
" nnoremap <leader>* <cmd>lua require('telescope.builtin').grep_string()<cr>
nnoremap <leader>*  :Rg <C-R><C-W><CR>
nnoremap <leader>g* :Rg <C-R><C-W>

xnoremap         *  "zy/<C-R><C-R>z<CR>
xnoremap         g* "zy/<C-R><C-R>z
xnoremap <leader>*  "zy:Rg <C-R><C-R>z<CR>
xnoremap <leader>g* "zy:Rg <C-R><C-R>z

nnoremap <leader>r :%s/\<<C-R><C-W>\>/<C-R><C-W>/g<Left><Left>
xnoremap <leader>r "zy:%s/\<<C-R><C-R>z\>/<C-R><C-R>z/g<Left><Left>

inoremap <C-K> <C-R>=strftime("%F")<CR>

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

noremap <leader>f :Neoformat<CR>

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

command Remove call delete(expand('%')) | bdelete!

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
