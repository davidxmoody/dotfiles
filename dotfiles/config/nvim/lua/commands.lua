vim.cmd('command Cppath let @+ = expand("%:p")')
vim.cmd('command Opdir :silent exec "!open " . fnameescape(expand("%:p:h"))')
vim.cmd('command Opfile :silent exec "!open " . fnameescape(expand("%:p"))')
vim.cmd('command Remove call delete(expand("%")) | bdelete!')
