local M = {}

M.config = function()
  -- Autocommands
  lvim.autocommands.custom_groups = {
    -- php, python, json
    { "Filetype", "php,python,json", "setlocal tabstop=4" },
    { "Filetype", "php,python,json", "setlocal softtabstop=4" },
    { "Filetype", "php,python,json", "setlocal shiftwidth=4" }
  }
end

return M
