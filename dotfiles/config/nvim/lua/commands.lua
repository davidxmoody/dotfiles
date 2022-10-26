vim.api.nvim_create_user_command("Cppath", "let @+ = expand(\"%:p\")", {})

vim.api.nvim_create_user_command("Opdir",
  ":silent exec \"!open \" . fnameescape(expand(\"%:p:h\"))", {})

vim.api.nvim_create_user_command("Opfile",
  ":silent exec \"!open \" . fnameescape(expand(\"%:p\"))", {})

vim.api.nvim_create_user_command("Remove",
  "call delete(expand(\"%\")) | bdelete!", {})
