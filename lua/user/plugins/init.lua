local M = {}

M.init = function()
	local frontend_file_types = { "html", "css", "javascript", "vue", "scss" }
	local fugitive_commands = {
		"G",
		"Git",
		"Gdiffsplit",
		"Gread",
		"Gwrite",
		"Ggrep",
		"GMove",
		"GDelete",
		"GBrowse",
		"GRemove",
		"GRename",
		"Glgrep",
		"Gedit",
	}

	lvim.colorscheme = "catppuccin"
	lvim.plugins = {
		--- DOCS: dependencies
		{
			"rcarriga/nvim-notify", -- not needed
			config = function()
				require("notify").setup({
					background_colour = "#000000",
					render = "compact",
					timeout = 1000, -- Duration in milliseconds
					fps = 60, -- Animation frame rate
					priority = 1000, -- Priority of the notification
					icons = {
						ERROR = "",
						WARN = "",
						INFO = "",
						DEBUG = "",
						TRACE = "✎",
					},
				})
			end,
		},
		--- DOCS: UI
		{
			"catppuccin/nvim", -- Theme -- installed
			name = "catppuccin",
			init = function()
				vim.g.catppuccin_flavour = require("user.config.theme").catppuccin_theme
			end,
			config = function()
				require("user.config.theme").catppuccin()
				vim.cmd([[colorscheme catppuccin]])
			end,
		},
		--- DOCS: Workflow
		{ "tpope/vim-fugitive", cmd = fugitive_commands }, --  Git management, commit, push and more
		{ "tpope/vim-rhubarb" },
    -- not necessary but it might be useful depending on the existing implementation 
		{
			"ray-x/lsp_signature.nvim", -- Function signatures -- installed
			event = "InsertEnter",
			config = function()
				require("user.plugins._signature").config()
			end,
		},
    -- already installed with lazyvim
		{
			"folke/trouble.nvim", -- Better diagnostics, references and more -- installed
			dependencies = { "nvim-tree/nvim-web-devicons" },
			cmd = "Trouble",
			event = "VeryLazy",
			config = function()
				require("trouble").setup({
					focus = true,
					preview = {
						type = "float",
						relative = "win",
						border = "rounded",
						title = "Preview",
						title_pos = "center",
						position = { 0, -2 },
						size = { width = 0.4, height = 0.3 },
						zindex = 200,
					},
				})
			end,
		},
    -- already installed with lazyvim
		{
			"folke/noice.nvim", -- installed
			event = "VeryLazy",
			dependencies = {
				"MunifTanjim/nui.nvim", -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
				"rcarriga/nvim-notify", -- `nvim-notify` is only needed, if you want to use the notification view.
			},
			config = function()
				require("user.plugins._noice").config()
			end,
		},
		-- Better quickfix preview and list
		{
			"kevinhwang91/nvim-bqf",
			config = function()
				require("user.plugins._bqf").config()
			end,
			event = "VeryLazy",
		},
		-- Find and replace across the whole project
    -- lazyvim has a builting that does the same thing
		{
			"windwp/nvim-spectre",
			event = "VeryLazy",
			config = function()
				require("user.plugins._spectre").config()
			end,
		},
		-- Motion provider
    -- already installed with lazyvim
		{
			"folke/flash.nvim",
			event = "VeryLazy",
			config = function()
				require("user.plugins._flash").config()
			end,
			keys = require("user.plugins._flash").keys,
		},
		--- DOCS: Language
		{ "mattn/emmet-vim", ft = frontend_file_types },
		{ "aca/emmet-ls", ft = frontend_file_types },
		--- DOCS: Utility
		{ "norcalli/nvim-colorizer.lua", event = "VeryLazy" }, --  Display hex colors preview
    -- already installed with lazyvim
		{ "tpope/vim-repeat", event = "VeryLazy" }, -- Repeat last command by pressing . (dot)
		{ "kchmck/vim-coffee-script", event = "BufRead" }, -- Syntax highlight for Coffescript
    -- already installed with lazyvim
		{
			"folke/todo-comments.nvim", -- Highlight TODO, FIXME, etc
			dependencies = { "nvim-lua/plenary.nvim" },
			event = "VeryLazy",
			config = function()
				require("user.plugins._todo_comments").config()
			end,
		},
    -- already installed with lazyvim
    {
      "github/copilot.vim",
      event = "BufRead",
      opts = { -- these are the default options
        lsp = {
          name = 'custom'
        }
      },
      config = function()
      end
    },
    {
      "luckasRanarison/tailwind-tools.nvim",
      name = "tailwind-tools",
      build = ":UpdateRemotePlugins",
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim", -- optional
        "neovim/nvim-lspconfig", -- optional
      },
      opts = {} -- your configuration
    },
    -- already installed with lazyvim
    { 'echasnovski/mini.comment',
      version = false,
      opts = { -- these are the default options
        options = {
          custom_commentstring = function()
            return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
          end,
        },
      }
    }
	}
end

return M
