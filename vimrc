" Miscellaneous 
:set nocompatible
:set ruler
:set autoread
:set ignorecase
:set smartcase
:set report=0
:set scrolloff=4
:set sidescrolloff=1
:set listchars=extends:>,precedes:<
:set directory=~/tmp,/var/tmp,/tmp,.
:set clipboard=unnamedplus
:set nojoinspaces
:set number

" Alternate binding for going from insert mode to normal mode and vice versa.
:noremap <Space> A

" Bind enter to 'o' and '-' to add a new list item.
:noremap <CR> o
:noremap - o-<Space>

" Quick way to save and/or exit from insert mode.
:inoremap MM <ESC>ZZ
:noremap MM ZZ
:inoremap HH <ESC>:update<CR>
:noremap HH :update<CR>
:noremap M <Nop>
:noremap S <Nop>
:noremap H <Nop>

" Tabs and indenting
:set tabstop=4
:set softtabstop=4
:set shiftwidth=4
:set expandtab
:set smarttab
:set autoindent

" Wrap at word boundaries.
:set linebreak
:set breakat=\ 
:set display=lastline

" No wrapping
:set nowrap

" Navigation with htns.
:noremap t j
:noremap n k
:noremap s l

:noremap T 
:noremap N 
:noremap S L

:noremap j n
:noremap k J
:noremap l t

:noremap J N
:noremap K gJ
:noremap L T

" n is next and prev search results
" t is until
" s is substitute
" J is join
" K is lookup keyword

" Abbreviations
:iab latek LaTeX
