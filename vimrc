" Wrap at word boundaries.
:set wrap
:set linebreak
:set nolist  " list disables linebreak
:set textwidth=0
:set wrapmargin=0

" Make j and k go up and down in wrapped lines instead of in actual lines.
:map j gj
:map k gk

" Alternate binding for going from insert mode to normal mode.
:inoremap <Tab> <ESC>

" Indenting
:set autoindent
