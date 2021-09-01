local M = {}

M.config = function ()
  lvim.plugins = {
    { "christoomey/vim-tmux-navigator" },
    { "reisnobre/Colorschemes" },
    { "tpope/vim-repeat" },
    { "tpope/vim-surround", keys = { "c","d","y" } },
    { "norcalli/nvim-colorizer.lua" },
    { "shaunsingh/nord.nvim" },
    { "nvim-treesitter/playground",
      event = "BufRead",
    },
    { "tpope/vim-fugitive", cmd = {
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
		},
    { "ray-x/lsp_signature.nvim",
      config = function()
        require("user/lsp_signature").config()
      end,
      event = "InsertEnter",
    },
    { "lukas-reineke/indent-blankline.nvim",
      config = function()
        require "user.blankline"
      end,
    },
    {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup()
      end,
      cmd = "Trouble",
    }
  }
end

return M
