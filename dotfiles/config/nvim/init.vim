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
set completeopt=menuone,noselect

Plug 'sbdchd/neoformat'
let g:shfmt_opt='-i 2 -sr -ci'
let g:neoformat_typescript_prettier = {'exe': './node_modules/.bin/prettier', 'args': ['--write', '--config .prettierrc'], 'replace': 1}
let g:neoformat_typescriptreact_prettier = {'exe': './node_modules/.bin/prettier', 'args': ['--write', '--config .prettierrc'], 'replace': 1}

" End of plugin manager setup ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

call plug#end()
filetype plugin indent on
syntax on

lua <<EOF

-- Treesitter

require'nvim-treesitter.configs'.setup {
  ensure_installed = {"typescript", "tsx", "javascript", "graphql", "python", "regex", "jsdoc", "html", "bash", "json", "yaml", "css", "lua"},
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}

-- LSP

local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
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

-- local servers = {"denols"}
local servers = {"tsserver"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

-- Completion

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
    nvim_lua = true;
    buffer = false;
    calc = false;
    vsnip = false;
    spell = false;
    tags = false;
    omni = false;
    snippets_nvim = false;
    treesitter = false;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

vim.api.nvim_set_keymap('i', '<C-Space>', 'compe#complete()', {silent = true, expr = true})
vim.api.nvim_set_keymap('i', '<CR>', [[compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })]], {silent = true, expr = true})

-- Nvim Tree

function create_nvim_tree_bindings()
  local function bind(key, cb_name)
    vim.api.nvim_buf_set_keymap(0, 'n', key,
      require('nvim-tree.config').nvim_tree_callback(cb_name),
      { noremap = true, silent = true, nowait = true })
  end

  bind("<CR>", "edit")
  bind("i", "edit")
  bind("<2-LeftMouse>", "edit")
  bind("g<CR>", "cd")
  bind("gi", "cd")
  bind("[h", "prev_git_item")
  bind("]h", "next_git_item")
  bind("-", "dir_up")
  bind("a", "create")
  bind("a", "create")
  bind("d", "remove")
  bind("x", "cut")
  bind("y", "copy")
  bind("Y", "copy_path")
  bind("gy", "copy_absolute_path")
  bind("p", "paste")
  bind("r", "rename")
  bind("R", "refresh")
  bind(".", "toggle_dotfiles")
  bind(",", "toggle_ignored")
  bind("<", "prev_sibling")
  bind(">", "next_sibling")
  bind("<BS>", "close_node")
  bind(";", "preview")
  bind("<leader>s", "vsplit")
  bind("<leader>h", "vsplit")
  bind("<leader>t", "split")
  bind("<leader>n", "split")
end

EOF

au Filetype NvimTree :lua create_nvim_tree_bindings()

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

set statusline=
set statusline+=%<%f
set statusline+=\ %h%q%r
set statusline+=%#CustomModifiedFlag#%m%*
set statusline+=%=\ 
set statusline+=%03.(%c%)\ %07.(%l/%L%)
set statusline+=%(\ %y%)

" Command line helpers ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

command Cppath let @+ = expand("%:p")
command Opdir :silent exec "!open " . fnameescape(expand("%:p:h"))
command Opfile :silent exec "!open " . fnameescape(expand("%:p"))
command Remove call delete(expand('%')) | bdelete!

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

lua require('keymapping')

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
