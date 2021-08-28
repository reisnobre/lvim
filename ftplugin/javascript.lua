vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

lvim.lang.javascript.linters = {
  {
    exe = "eslint_d"
  }
}
lvim.lang.javascript.formatters = {
  {
    exe = "prettier"
  }
}
