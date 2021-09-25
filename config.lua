-- Leader
lvim.leader = "space"

-- Vim config options
vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2
vim.opt.guifont = "FiraCode Nerd Font:h14"
vim.opt.mouse=""
vim.opt.relativenumber = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.timeoutlen = 200 -- increase this to your liking
vim.opt.wrap = false

-- Lvim config options
lvim.lint_on_save = true
lvim.format_on_save = false
lvim.colorscheme = "norddark"
lvim.transparent_window = false
lvim.debug = false

-- Builtin customization
require("user.builtins").config()

--- Additional Plugins
require("user.plugins").config()

-- Autocommands
require("user.autocommands").config()

-- Additional keybindings
require("user.keybindings").config()
