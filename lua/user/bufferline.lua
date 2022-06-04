local M = {}

M.config = function ()
  local kind = require "user.lsp_kind"
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

  lvim.builtin.bufferline.options.groups = {
    items = {
      { name = "ungrouped" },
      {
        highlight = { guisp = "#42b883" },
        name = "front",
        icon = kind.icons.html,
        matcher = function(buf)
          return buf.filename:match ".vue"
            or buf.filename:match ".js"
            or buf.filename:match ".scss"
        end,
      },
      {
        highlight = { guisp = "#fb503b" },
        name = "back",
        icon = kind.icons.database,
        matcher = function(buf)
          return buf.filename:match ".php"
        end,
      },
    }
  }
end

return M
