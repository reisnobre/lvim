local M = {}

M.config = function()
  local kind = require "user.lsp_kind"

  -- Base builtins
  lvim.builtin.dashboard.active = true
  lvim.builtin.terminal.active = true
  lvim.builtin.terminal.direction = 'horizontal'
  lvim.builtin.terminal.shading_factor = 3
  lvim.builtin.notify.active = true
  lvim.builtin.motion_provider = 'lightspeed' -- change this to use different motion providers ( hop or lightspeed )

  -- Telescope
  lvim.builtin.telescope.defaults.path_display = { shorten = 10 }
  lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
  lvim.builtin.telescope.defaults.layout_config = require("user.telescope").layout_config()

  -- Nvimtree
  lvim.builtin.nvimtree.side = "left"
  lvim.builtin.nvimtree.show_icons.git = 1
  lvim.builtin.nvimtree.setup.auto_open = 0
  lvim.builtin.nvimtree.icons = kind.nvim_tree_icons
  lvim.builtin.nvimtree.setup.diagnostics = {
    enable = true,
    icons = {
      hint = kind.icons.hint,
      info = kind.icons.info,
      warning = kind.icons.warn,
      error = kind.icons.error,
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
  lvim.lsp.automatic_servers_installation = false
  vim.list_extend(lvim.lsp.override, { "volar" })

  lvim.lsp.diagnostics.signs.values = {
    { name = "DiagnosticSignError", text = kind.icons.error },
    { name = "DiagnosticSignWarn", text = kind.icons.warn },
    { name = "DiagnosticSignInfo", text = kind.icons.info },
    { name = "DiagnosticSignHint", text = kind.icons.hint },
  }

  -- -- Tailwindcss
  require("user.tailwind")

  -- Linter configuration
  require("user.linters").config()

  -- Cmp customization
  require("user.builtin.cmp").config()
end

return M
