local M = {}

local create_aucmd = vim.api.nvim_create_autocmd

M.config = function()
  -- Autocommands
  vim.api.nvim_create_augroup("_lvim_user", {})

  if lvim.builtin.nonumber_unfocus then
    create_aucmd("WinEnter", { group = "_lvim_user", pattern = "*", command = "set relativenumber number cursorline" })
    create_aucmd(
      "WinLeave",
      { group = "_lvim_user", pattern = "*", command = "set norelativenumber nonumber nocursorline" }
    )
  end

  create_aucmd("Filetype", { group = "_lvim_user", pattern = {"php", "python", "json"}, command = "setlocal tabstop=4" })
  create_aucmd("Filetype", { group = "_lvim_user", pattern = {"php", "python", "json"}, command = "setlocal softtabstop=4" })
  create_aucmd("Filetype", { group = "_lvim_user", pattern = {"php", "python", "json"}, command = "setlocal shiftwidth=4" })
end

return M
