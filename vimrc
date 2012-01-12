" Miscellaneous 
:set nocompatible
:set ruler
:set autoread
:set ignorecase
:set smartcase
:set report=0
:set scrolloff=4

" Wrap at word boundaries.
:set wrap
:set linebreak
:set nolist
:set textwidth=0
:set wrapmargin=0
:set display=lastline

" Alternate binding for going from insert mode to normal mode.
:inoremap <Tab> <ESC>

" Quick way to save and exit from insert mode.
:inoremap ZZ <ESC>ZZ

" Tabs and indenting
:set tabstop=4
:set softtabstop=4
:set shiftwidth=4
:set expandtab
:set smarttab
:set autoindent

" Navigation with htns.
:noremap t j
:noremap n k
:noremap s l

:noremap T J
:noremap N K
:noremap S L

:noremap j n
:noremap k S
:noremap l t

:noremap J N
:noremap K s
:noremap L T

" Make t and n go up and down in wrapped lines instead of actual lines.
:map t gj
:map n gk

