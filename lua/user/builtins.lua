local M = {}

M.config = function()
  -- Base builtins
  lvim.builtin.terminal.active = false
  lvim.builtin.bufferline.active = true
  lvim.builtin.notify.active = true
  lvim.builtin.motion_provider = 'lightspeed'

  -- Telescope
  require("user.telescope").config()

   -- NvimTree
  require("user.nvimtree").config()

  -- Treesitter
  require("user.treesitter").config()

  -- LSP
  require("user.lsp").config()

  -- Bufferline
  require("user.bufferline").config()

  -- Linter configuration
  require("user.linters").config()

  -- Cmp customization
  require("user.builtin.cmp").config()

  -- Null ls customization
  require("user.null-ls").config()

  -- Lualine
  require("user.lualine").config()
end

return M
