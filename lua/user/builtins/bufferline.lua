local M = {}

M.config = function ()
  local kind = require "user.utils.lsp_kind"
  lvim.builtin.bufferline.options.diagnostics_indicator = function(_, _, diagnostics)
    local result = {}
    local symbols = { error = kind.icons.error, warning = kind.icons.warn, info = kind.icons.info }
    for name, count in pairs(diagnostics) do
      if symbols[name] and count > 0 then
        table.insert(result, symbols[name] .. count)
      end
    end
    result = table.concat(result, " ")
    return #result > 0 and result or ""
  end
end

return M
