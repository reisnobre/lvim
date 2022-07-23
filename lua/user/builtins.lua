local M = {}

M.config = function()
  local kind = require "user.lsp_kind"

  -- Base builtins
  lvim.builtin.terminal.active = true
  lvim.builtin.terminal.direction = 'horizontal'
  lvim.builtin.terminal.shading_factor = 3
  lvim.builtin.bufferline.active = true
  lvim.builtin.notify.active = true
  lvim.builtin.motion_provider = 'lightspeed' -- change this to use different motion providers ( hop or lightspeed )

  -- Telescope
  require("user.telescope").config()

   -- NvimTree
  -- =========================================
  lvim.builtin.nvimtree.setup.diagnostics = {
    enable = true,
    icons = {
      hint = kind.icons.hint,
      info = kind.icons.info,
      warning = kind.icons.warn,
      error = kind.icons.error,
    },
  }
  lvim.builtin.nvimtree.setup.renderer.icons.glyphs = kind.nvim_tree_icons
  lvim.builtin.nvimtree.on_config_done = function(_)
    lvim.builtin.which_key.mappings.n = { ":NvimTreeToggle<CR>", "Toggle NvimTree" }
  end

  -- Treesitter
  lvim.builtin.treesitter.ensure_installed = { "html", "css", "scss", "javascript", "vue", "yaml", "bash", "comment", "dockerfile", "dot", "json", "json5", "lua", "markdown", "php", "typescript", "vim"}
  lvim.builtin.treesitter.ignore_install = { "haskell" }
  lvim.builtin.treesitter.highlight.enabled = true
  lvim.builtin.treesitter.matchup.enable = true
  lvim.builtin.treesitter.playground.enable = true
  lvim.builtin.treesitter.context_commentstring.enable = true

  -- LSP
  lvim.lsp.document_highlight = false
  lvim.lsp.diagnostics.virtual_text = false
  lvim.lsp.automatic_servers_installation = false
  lvim.lsp.diagnostics.float.focusable = false
  lvim.lsp.float.focusable = true

  lvim.lsp.diagnostics.signs.values = {
    { name = "DiagnosticSignError", text = kind.icons.error },
    { name = "DiagnosticSignWarn", text = kind.icons.warn },
    { name = "DiagnosticSignInfo", text = kind.icons.info },
    { name = "DiagnosticSignHint", text = kind.icons.hint },
  }

  -- Bufferline
  require("user.bufferline").config()

  -- Tailwindcss
  require("user.tailwind").config()

  -- Markdown
  require("user.null-ls.markdown").config()

  -- Linter configuration
  require("user.linters").config()

  -- Cmp customization
  require("user.builtin.cmp").config()

  -- Null ls customization
  require("user.null-ls").config()
end

return M
