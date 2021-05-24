" Setup plugin manager ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

if empty(glob("~/.config/nvim/autoload/plug.vim"))
  execute '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

filetype off
call plug#begin('~/.vim/plugged')

lua require('plugins')

call plug#end()
filetype plugin indent on
syntax on

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

" Lua requires ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

lua require('options')
lua require('lsp')
lua require('completion')
lua require('keymapping')
lua require('colorscheme')
lua require('commands')
lua require('statusline')

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
