local M = {}

M.init = function()
  -- Base builtins
  lvim.builtin.terminal.active = false
  lvim.builtin.bufferline.active = true
  lvim.builtin.nvimtree.active = true
  lvim.builtin.lir.active = false

  -- Telescope
  require("user.builtins.telescope").config()

   -- NvimTree
  require("user.builtins.nvimtree").config()

  -- Treesitter
  require("user.builtins.treesitter").config()

  -- LSP
  require("user.builtins.lsp").config()

  -- Bufferline
  require("user.builtins.bufferline").config()

  -- Linter configuration
  require("user.config.linters").config()

  -- Cmp customization
  require("user.builtins.cmp").config()

  -- Null ls customization
  require("user.builtins.null-ls").config()

  -- Lualine
  require("user.builtins.lualine").config()
end

return M
