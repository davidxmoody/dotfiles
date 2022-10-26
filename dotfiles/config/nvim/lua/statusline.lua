vim.opt.statusline = table.concat({
  "%<%f",
  " %h%q%r",
  "%#CustomModifiedFlag#%m%*",
  "%= ",
  "%03.(%c%) %07.(%l/%L%)",
  "%( %y%)",
})
