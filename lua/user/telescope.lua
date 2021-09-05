local M = {}

local themes = require "telescope.themes"
local builtin = require "telescope.builtin"

function M.layout_config()
  return {
    width = 0.90,
    height = 0.85,
    preview_cutoff = 120,
    prompt_position = "bottom",
    horizontal = {
      preview_width = function(_, cols, _)
        if cols > 200 then
          return math.floor(cols * 0.5)
        else
          return math.floor(cols * 0.6)
        end
      end,
    },
    vertical = {
      width = 0.9,
      height = 0.95,
      preview_height = 0.5,
    },

    flex = {
      horizontal = {
        preview_width = 0.9,
      },
    },
  }
end

function M.code_actions()
  local opts = {
    winblend = 10,
    border = true,
    previewer = false,
    shorten_path = false,
  }
  builtin.lsp_code_actions(themes.get_dropdown(opts))
end

return M
