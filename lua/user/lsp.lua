local M = {}

M.confg = function ()
  lvim.lsp.diagnostics.virtual_text = false
  lvim.lang.tailwindcss.lsp.active = true
end

return M
