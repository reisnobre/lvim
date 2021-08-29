local M = {}

M.config = function()
  -- Base builitns
  lvim.builtin.dashboard.active = true
  lvim.builtin.terminal.active = false

  -- Nvimtree
  lvim.builtin.nvimtree.side = "left"
  lvim.builtin.nvimtree.show_icons.git = 1

  -- Treesitter
  lvim.builtin.treesitter.ensure_installed = "maintained"
  lvim.builtin.treesitter.ignore_install = { "haskell" }
  lvim.builtin.treesitter.highlight.enabled = true
  lvim.builtin.treesitter.matchup.enable = true

  -- Bufferline
  lvim.builtin.bufferline.left_mouse_command = nil

  -- Compe
  lvim.builtin.compe.documentation.border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }

end

return M
