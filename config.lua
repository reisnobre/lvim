-- Leader
lvim.leader = "space"

-- Vim config options
vim.opt.wrap = false
vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2
vim.opt.relativenumber = true
vim.opt.timeoutlen = 200 -- increase this to your liking
vim.opt.mouse=""

-- Lvim config options
lvim.lint_on_save = true
lvim.format_on_save = false
lvim.colorscheme = "norddark"
lvim.transparent_window = false
lvim.debug = false

-- Builtin customization
require("user.builtins").config()

-- LSP customization
require("user.lsp").config()

--- Additional Plugins
require("user.plugins").config()

-- Autocommands
require("user.autocommands").config()

-- Additional keybindings
require("user.keybindings").config()
