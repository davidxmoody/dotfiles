vim.cmd([[
  func! WordProcessorMode()
    source ~/.vim_abbreviations

    augroup auto_capitalize_sentences
      au!
      au InsertCharPre <buffer> if search('\v(%^|%^[1-7]{2}\s|[.!?]\_s+|\_^\s*\-\s|\_^#+\s|\_^title\:\s|\n\n)%#', 'bcnw') != 0 | let v:char = toupper(v:char) | endif
    augroup END
  endfu

  com! WP call WordProcessorMode()

  au BufNewFile,BufRead diary-*.md call WordProcessorMode()
]])
