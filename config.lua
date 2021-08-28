-- Vim config options
vim.opt.wrap = false
vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2
vim.opt.relativenumber = true
vim.opt.timeoutlen = 200 -- increase this to your liking

-- Lvim config options
lvim.lint_on_save = true
lvim.format_on_save = true
lvim.colorscheme = "nord"
lvim.transparent_window = false
lvim.debug = false

lvim.builtin.terminal.active = false

-- Leader
lvim.leader = "space"

-- Nvimtree
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- Barbar

lvim.builtin.bufferline.left_mouse_command = nil

-- LSP
lvim.lsp.diagnostics.virtual_text = false

--- Additional Plugins
require("user.plugins").config()

-- Autocommands
require("user.autocommands").config()

-- Additional keybindings
require("user.keybindings").config()
