vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

lvim.lang.vue.formatters = {
  {
    exe = "prettier",
    -- args = {},
  },
}

lvim.lang.vue.linters = {
  {
    exe = "eslint_d"
  }
}
