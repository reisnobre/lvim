local M = {}

M.config = function ()
  local frontend_file_types = { "html", "css", "javascript", "vue", "scss" }
  local fugitive_commands = { "G", "Git", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse", "GRemove", "GRename", "Glgrep", "Gedit" }

  lvim.plugins = {
    --- Workflow
    -- Git management, commit, push and more
    { "tpope/vim-fugitive", cmd = fugitive_commands },
    { "tpope/vim-rhubarb" },
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
      dependencies = { "nvim-tree/nvim-web-devicons" },
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
    -- Motion provider
    {
      "folke/flash.nvim",
      config = function()
        require("user.flash").config()
      end,
    },
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("user.todo_comments").config()
      end,
      event = "BufRead",
    },
    --- Language
    { "mattn/emmet-vim", ft = frontend_file_types },
    { "aca/emmet-ls", ft = frontend_file_types },
    --- UI
    --- Utility
    -- Display hex colors preview
    { "norcalli/nvim-colorizer.lua", event = "BufRead" },
    -- Repeat last command by pressing . (dot)
    { "tpope/vim-repeat", event = "BufRead" },
    -- Change surround brackets, quotes and more
    { "tpope/vim-surround", keys = { "c","d","y" }, event = "BufRead" },
    -- Syntax highlight for Coffescript
    -- { "kchmck/vim-coffee-script", event = "BufRead" },
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
      "j-hui/fidget.nvim",
      config = function()
        require("user.fidget").config()
      end,
    },
    {
      "catppuccin/nvim",
      name = "catppuccin",
      init = function()
        vim.g.catppuccin_flavour = "mocha"
      end,
      config = function()
        require("user.theme").catppuccin()
        vim.cmd [[colorscheme catppuccin]]
      end
    },
    {
      "zbirenbaum/copilot.lua",
       cmd = "Copilot",
      event = "InsertEnter",
      config = function()
        require("copilot").setup({
          suggestion = { enabled = false },
          panel = { enabled = false }
        })
      end
    },
    {
      "zbirenbaum/copilot-cmp",
      dependencies = { "zbirenbaum/copilot.lua" },
      config = function ()
        require("copilot_cmp").setup()
      end
    }
  }
end

return M
