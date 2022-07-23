require("lvim.lsp.manager").setup("intelephense")
require("lvim.lsp.manager").setup("phpactor", {
  ["language_server_phpstan.enabled"] = true,
  ["language_server_psalm.enabled"] = true,
})
require("lvim.lsp.manager").setup("psalm", {})
