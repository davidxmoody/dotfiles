vim.cmd([[
  func! WordProcessorMode()
    inoreabbrev <buffer> i I
    inoreabbrev <buffer> (i (I
    inoreabbrev <buffer> id I'd
    inoreabbrev <buffer> Id I'd
    inoreabbrev <buffer> im I'm
    inoreabbrev <buffer> Im I'm
    inoreabbrev <buffer> iv I've
    inoreabbrev <buffer> Iv I've
    inoreabbrev <buffer> il I'll
    inoreabbrev <buffer> Il I'll
    inoreabbrev <buffer> hev however
    inoreabbrev <buffer> Hev however

    augroup auto_capitalize_sentences
      au!
      au InsertCharPre <buffer> if search('\v^%#|^\s*-\s+%#|^#+\s+%#|[.!?]\s+%#', 'bcnW') != 0 | let v:char = toupper(v:char) | endif
    augroup END
  endfu

  com! WP call WordProcessorMode()

  au BufNewFile,BufRead diary-*.md call WordProcessorMode()
]])
