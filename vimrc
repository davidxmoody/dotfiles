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
":set mouse=vin
:set directory=~/tmp,/var/tmp,/tmp,.
:set clipboard=unnamedplus
":set shellcmdflag=-ic
:set nojoinspaces

" Alternate binding for going from insert mode to normal mode and vice versa.
":inoremap <Tab> <ESC>
:inoremap kj <ESC>
:inoremap kkj <ESC>:update<CR>
:inoremap jk <ESC>l
:inoremap jjk <ESC>:update<CR>:q<CR>
:noremap <Space> A

:noremap <CR> o
:noremap - o-<Space>

" Quick way to save and/or exit from insert mode.
":inoremap ZZ <ESC>ZZ
":inoremap SS <ESC>:update<CR>
":noremap SS :update<CR>

" Tabs and indenting
:set tabstop=4
:set softtabstop=4
:set shiftwidth=4
:set expandtab
:set smarttab
:set autoindent

" Wrapping
:set linebreak
:set breakat=\ 
:set display=lastline
:set nowrap

" Navigation with htns.
":noremap t j
":noremap n k
":noremap s l

":noremap T gj
":noremap N gk
":noremap S L

":noremap j n
":noremap k J
":noremap l t

":noremap J N
":noremap K gJ
":noremap L T

" n is next and prev search results
" t is until
" s is substitute
" J is join
" K is lookup keyword

" Abbreviations
":iab rss RSS
":iab ssd SSD
":iab ssh SSH
":iab latek LaTeX

" Surrounds
" TODO make this work in visual mode
":map S <Nop>
":map S` sBi`<ESC>Ea`<ESC>
":map S' sBi'<ESC>Ea'<ESC>
":map S" sBi"<ESC>Ea"<ESC>
":map S* sBi*<ESC>Ea*<ESC>
":map Sb sBi(<ESC>Ea)<ESC>
":map S[ sBi[<ESC>Ea]<ESC>
":map S] sBi[<ESC>Ea]<ESC>
":map S{ sBi{<ESC>Ea}<ESC>
":map S} sBi{<ESC>Ea}<ESC>
