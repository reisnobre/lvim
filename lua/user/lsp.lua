local M = {}
local kind = require("user.lsp_kind")

M.config = function ()
  lvim.lsp.diagnostics.virtual_text = false
  lvim.lsp.document_highlight = false
  lvim.lsp.automatic_servers_installation = false
  lvim.lsp.diagnostics.float.focusable = false
  lvim.lsp.float.focusable = true

  lvim.lsp.diagnostics.signs.values = {
    { name = "DiagnosticSignError", text = kind.icons.error },
    { name = "DiagnosticSignWarn", text = kind.icons.warn },
    { name = "DiagnosticSignInfo", text = kind.icons.info },
    { name = "DiagnosticSignHint", text = kind.icons.hint },
  }
end

return M
