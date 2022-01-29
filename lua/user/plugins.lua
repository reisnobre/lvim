local M = {}

M.config = function ()
  local frontend_file_types = { "html", "css", "javascript", "vue", "scss" }
  local fugitive_commands = { "G", "Git", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse", "GRemove", "GRename", "Glgrep", "Gedit" }

  lvim.plugins = {
    --- Workflow
    -- Git management, commit, push and more
    { "tpope/vim-fugitive", cmd = fugitive_commands },
    -- Function signatures
    { "ray-x/lsp_signature.nvim",
      config = function()
        require("user/signature").config()
      end,
      event = "InsertEnter",
    },
    -- Better diagnostics, references and more
    {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup()
      end,
      cmd = "Trouble",
      event = "BufRead",
    },
    -- Better quickfix preview and list
    {
      "kevinhwang91/nvim-bqf",
      config = function()
        require("user.bqf").config()
      end,
      event = "BufRead",
    },
    -- Find and replace across the whole project
    {
      "windwp/nvim-spectre",
      event = "BufRead",
      config = function()
        require("user.spectre").config()
      end,
    },
    -- Run tests quickly
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
    --- Language
		{ "mattn/emmet-vim", ft = frontend_file_types },
		{ "aca/emmet-ls", ft = frontend_file_types },
    --- Theme
    -- Colorscheme
    {
      "rebelot/kanagawa.nvim",
      config = function()
        require("user.theme").kanagawa()
      end,
    },
    --- Utility
    -- Display hex colors preview
    { "norcalli/nvim-colorizer.lua", event = "BufRead" },
    -- Repeat last command by pressing . (dot)
    { "tpope/vim-repeat", event = "BufRead" },
    -- Change surround brackets, quotes and more
    { "tpope/vim-surround", keys = { "c","d","y" }, event = "BufRead" },
    -- Syntax highlight for Coffescript
    { "kchmck/vim-coffee-script", event = "BufRead" },
    -- Show indentation guides
    { "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("user.indent").config()
      end,
      event = "BufRead",
    },
    --- Others
    -- Show LSP requests loading
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
