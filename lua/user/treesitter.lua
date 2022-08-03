local M = {}
local kind = require("user.lsp_kind")

M.config = function ()
  lvim.builtin.treesitter.ensure_installed = { "html", "css", "scss", "javascript", "vue", "yaml", "bash", "comment", "dockerfile", "dot", "json", "json5", "lua", "markdown", "php", "typescript", "vim"}
  lvim.builtin.treesitter.ignore_install = { "haskell" }
  lvim.builtin.treesitter.highlight.enabled = true
  lvim.builtin.treesitter.matchup.enable = true
  lvim.builtin.treesitter.playground.enable = true
  lvim.builtin.treesitter.context_commentstring.enable = true
end

return M
