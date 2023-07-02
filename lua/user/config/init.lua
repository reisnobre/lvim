local M = {}

M.init = function ()
  -- Vim config options
  require("user.config.neovim").config()

  -- Autocommands
  require("user.config.autocommands").config()

  -- Additional keybindings
  require("user.config.keybindings").config()
end

return M
