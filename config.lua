-- -- Lvim config options
lvim.leader = "space"
lvim.lint_on_save = true
lvim.format_on_save = false
lvim.colorscheme = "catppuccin"
lvim.transparent_window = false
lvim.debug = true

-- Vim config options
require("user.neovim").config()

-- Builtin customization
require("user.builtins").config()

-- Additional Plugins
require("user.plugins").config()

-- Autocommands
require("user.autocommands").config()

-- Additional keybindings
require("user.keybindings").config()
