vim.g["nightflyUnderlineMatchParen"] = 1

vim.cmd("colorscheme nightfly")

vim.api.nvim_set_hl(0, "CustomModifiedFlag", {bg="Red", fg="White"})
vim.api.nvim_set_hl(0, "Pmenu", {fg=0, bg=13, fg="fg", bg="#1d3b53"})

-- For focused windows, use the 'default' background color (from tmux). This
-- means the current Vim window will be highlighted only if the tmux pane that
-- vim is running in is also currently active.
vim.api.nvim_set_hl(0, "Normal", {bg="NONE"})

-- Unfocused background color duplicated in tmux config
vim.api.nvim_set_hl(0, "NormalNC", {bg="#000a13"})
