-- Lvim config options
lvim.leader = "space"
lvim.lint_on_save = true
lvim.format_on_save = false
lvim.colorscheme = "catppuccin"
lvim.transparent_window = false
lvim.debug = true

-- Vim config options
require("user.config").init()

-- Builtin customization
require("user.builtins").init()

-- Additional Plugins
require("user.plugins").init()
