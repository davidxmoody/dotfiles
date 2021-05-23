vim.g['nightflyUnderlineMatchParen'] = 1

vim.cmd('colorscheme nightfly')

vim.cmd('hi Pmenu ctermfg=0 ctermbg=13 guifg=fg guibg=#1d3b53')

-- For focused windows, use the 'default' background color (from tmux). This
-- means the current Vim window will be highlighted only if the tmux pane that
-- vim is running in is also currently active.
vim.cmd('highlight Normal guibg=NONE')

-- Unfocused background color duplicated in tmux config
vim.cmd('highlight NormalNC guibg=#000a13')
