local M = {}

M.config = function()
  -- Base builtins
  lvim.builtin.dashboard.active = true

  lvim.builtin.project.exclude_dirs = { "~/Archive/*" }

  lvim.builtin.terminal.active = true
  lvim.builtin.terminal.direction = 'horizontal'
  lvim.builtin.terminal.shading_factor = 3

  -- Telescope
  lvim.builtin.telescope.defaults.path_display = { shorten = 10 }
  lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
  lvim.builtin.telescope.defaults.layout_config = require("user.telescope").layout_config()

  -- Nvimtree
  lvim.builtin.nvimtree.side = "left"
  lvim.builtin.nvimtree.show_icons.git = 1
  lvim.builtin.nvimtree.hide_dotfiles = 0
  lvim.builtin.nvimtree.setup.auto_open = 0
  lvim.builtin.nvimtree.setup.diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  }

  -- Treesitter
  lvim.builtin.treesitter.ensure_installed = "maintained"
  lvim.builtin.treesitter.ignore_install = { "haskell" }
  lvim.builtin.treesitter.highlight.enabled = true
  lvim.builtin.treesitter.matchup.enable = true
  lvim.builtin.treesitter.playground.enable = true
  lvim.builtin.treesitter.context_commentstring.enable = true

  -- LSP
  lvim.lsp.document_highlight = false
  lvim.lsp.diagnostics.virtual_text = false

  -- Linter configuration
  require("user.linters").config()

  -- Cmp customization
  require("user.builtin.cmp").config()
end

return M
