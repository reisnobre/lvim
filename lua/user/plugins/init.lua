local M = {}

M.init = function ()
  local frontend_file_types = { "html", "css", "javascript", "vue", "scss" }
  local fugitive_commands = { "G", "Git", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse", "GRemove", "GRename", "Glgrep", "Gedit" }

  lvim.plugins = {
    --- DOCS: dependencies
    { "MunifTanjim/nui.nvim" },
    { "rcarriga/nvim-notify" },
    --- DOCS: Workflow
    --  Git management, commit, push and more
    { "tpope/vim-fugitive", cmd = fugitive_commands },
    { "tpope/vim-rhubarb" },
    -- Function signatures
    { "ray-x/lsp_signature.nvim",
      config = function()
        require("user.plugins._signature").config()
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
      event = "VeryLazy",
    },
    {
      "folke/noice.nvim",
      event = "VeryLazy",
      config = function()
        require("user.plugins._noice").config()
      end,
      dependencies = {
        "MunifTanjim/nui.nvim", -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "rcarriga/nvim-notify", -- `nvim-notify` is only needed, if you want to use the notification view.
      }
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
    {
      "windwp/nvim-spectre",
      event = "VeryLazy",
      config = function()
        require("user.plugins._spectre").config()
      end,
    },
    -- Motion provider
    {
      "folke/flash.nvim",
      event = "VeryLazy",
      config = function()
        require("user.plugins._flash").config()
      end,
      keys = {
        {
          "s",
          mode = { "n", "x", "o" },
          function()
            require("flash").jump()
          end,
          desc = "Flash",
        },
        {
          "S",
          mode = { "n", "o", "x" },
          function()
            require("flash").treesitter()
          end,
          desc = "Flash Treesitter",
        },
        {
          "r",
          mode = "o",
          function()
            require("flash").remote()
          end,
          desc = "Remote Flash",
        },
        {
          "R",
          mode = { "o", "x" },
          function()
            require("flash").treesitter_search()
          end,
          desc = "Flash Treesitter Search",
        },
        {
          "<c-s>",
          mode = { "c" },
          function()
            require("flash").toggle()
          end,
          desc = "Toggle Flash Search",
        }
      }
    },
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("user.plugins._todo_comments").config()
      end,
      event = "VeryLazy",
    },
    --- DOCS: Language
    { "mattn/emmet-vim", ft = frontend_file_types },
    { "aca/emmet-ls", ft = frontend_file_types },
    --- DOCS: UI

    --- DOCS: Utility
    -- Display hex colors preview
    { "norcalli/nvim-colorizer.lua", event = "VeryLazy" },
    -- Repeat last command by pressing . (dot)
    { "tpope/vim-repeat", event = "VeryLazy" },
    -- Change surround brackets, quotes and more
    { "tpope/vim-surround", keys = { "c","d","y" }, event = "VeryLazy" },
    -- Syntax highlight for Coffescript
    { "kchmck/vim-coffee-script", event = "BufRead" },
    -- Show indentation guides
    { "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("user.plugins._indent").config()
      end,
      event = "BufRead",
    },
    --- Others
    {
      "catppuccin/nvim",
      name = "catppuccin",
      init = function()
        vim.g.catppuccin_flavour = "mocha"
      end,
      config = function()
        require("user.config.theme").catppuccin()
        vim.cmd [[colorscheme catppuccin]]
      end
    },
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      event = "BufRead",
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
      event = "BufRead",
      config = function ()
        require("copilot_cmp").setup()
      end
    }
  }
end

return M
