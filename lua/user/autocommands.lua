local M = {}

M.config = function()
  -- Autocommands
  lvim.autocommands.custom_groups = {
    -- html, javascript, vue
    { "Filetype", "html,javascript,vue", "setlocal tabstop=2" },
    { "Filetype", "html,javascript,vue", "setlocal softtabstop=2" },
    { "Filetype", "html,javascript,vue", "setlocal shiftwidth=2" },

    -- php, python, json
    { "Filetype", "php,python,json", "setlocal tabstop=4" },
    { "Filetype", "php,python,json", "setlocal softtabstop=4" },
    { "Filetype", "php,python,json", "setlocal shiftwidth=4" }
  }
end

return M
