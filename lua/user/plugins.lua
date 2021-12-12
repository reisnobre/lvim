local M = {}

M.config = function ()
  lvim.plugins = {
    { "reisnobre/Colorschemes" },
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
    { "norcalli/nvim-colorizer.lua",
      event = "BufRead",
    },
    { "ray-x/lsp_signature.nvim",
      config = function()
        require("user/signature").config()
      end,
      event = "InsertEnter",
    },
    { "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("user.indent").config()
      end,
      event = "BufRead",
    },
    {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup()
      end,
      cmd = "Trouble",
      event = "BufRead",
    },
    { "tpope/vim-repeat",
      event = "BufRead",
    },
    { "tpope/vim-surround",
      keys = { "c","d","y" },
      event = "BufRead",
    },
    { "vim-test/vim-test",
      cmd = { "Test*" },
      keys = { "<localleader>tf", "<localleader>tn", "<localleader>ts" },
      config = function()
        vim.cmd [[
        function! ToggleTermStrategy(cmd) abort
        call luaeval("require('toggleterm').exec(_A[1])", [a:cmd])
        endfunction
        let g:test#custom_strategies = {'toggleterm': function('ToggleTermStrategy')}
        ]]
        vim.g["test#strategy"] = "toggleterm"
      end,
      event = "BufRead",
    },
    {
      "kevinhwang91/nvim-bqf",
      config = function()
        require("user.bqf").config()
      end,
      event = "BufRead",
    },
    {
      "kchmck/vim-coffee-script",
      event = "BufRead",
    },
		{
			"mattn/emmet-vim",
			ft = { "html", "css", "javascript", "vue", "scss" },
		},
		{
			"aca/emmet-ls",
			ft = {
				"html",
				"css",
				"javascript",
        "scss",
        "vue"
			},
		},
    {
      "windwp/nvim-spectre",
      event = "BufRead",
      config = function()
        require("user.spectre").config()
      end,
    }
  }
end

return M
