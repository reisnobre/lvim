local M = {}
local kind = require("user.utils.lsp_kind")

M.config = function ()
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
end

return M
