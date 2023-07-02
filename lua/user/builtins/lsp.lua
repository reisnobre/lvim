local M = {}
local kind = require("user.utils.lsp_kind")

M.default_diagnostic_config = {
  signs = {
    active = true,
    values = {
      { name = "DiagnosticSignError", text = kind.icons.error },
      { name = "DiagnosticSignWarn", text = kind.icons.warn },
      { name = "DiagnosticSignInfo", text = kind.icons.info },
      { name = "DiagnosticSignHint", text = kind.icons.hint },
    },
  },
  virtual_text = false,
  underline = true,
  severity_sort = true
}

M.config = function ()
  lvim.lsp.document_highlight = false
  lvim.lsp.automatic_servers_installation = false
  if lvim.builtin.lsp_lines then
    M.default_diagnostic_config.virtual_text = false
  end
  vim.diagnostic.config(M.default_diagnostic_config)
end

return M
