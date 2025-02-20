local M = {}

M.init = function ()
  local frontend_file_types = { "html", "css", "javascript", "vue", "scss" }
  local fugitive_commands = { "G", "Git", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse", "GRemove", "GRename", "Glgrep", "Gedit" }

  lvim.colorscheme = "catppuccin"
  lvim.plugins = {
    --- DOCS: dependencies
    { "rcarriga/nvim-notify",
      config = function ()
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
      end
    },
    --- DOCS: UI
    { "catppuccin/nvim", -- Theme
      name = "catppuccin",
      init = function()
        vim.g.catppuccin_flavour = require("user.config.theme").catppuccin_theme
      end,
      config = function()
        require("user.config.theme").catppuccin()
        vim.cmd [[colorscheme catppuccin]]
      end
    },
    --- DOCS: Workflow
    { "tpope/vim-fugitive", cmd = fugitive_commands },  --  Git management, commit, push and more
    { "tpope/vim-rhubarb" },
    { "ray-x/lsp_signature.nvim", -- Function signatures
      event = "InsertEnter",
      config = function()
        require("user.plugins._signature").config()
      end
    },
    { "folke/trouble.nvim", -- Better diagnostics, references and more
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
      end
    },
    { "folke/noice.nvim",
      event = "VeryLazy",
      dependencies = {
        "MunifTanjim/nui.nvim", -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "rcarriga/nvim-notify", -- `nvim-notify` is only needed, if you want to use the notification view.
      },
      config = function()
        require("user.plugins._noice").config()
      end
    },
    -- Better quickfix preview and list
    { "kevinhwang91/nvim-bqf",
      config = function()
        require("user.plugins._bqf").config()
      end,
      event = "VeryLazy",
    },
    -- Find and replace across the whole project
    { "windwp/nvim-spectre",
      event = "VeryLazy",
      config = function()
        require("user.plugins._spectre").config()
      end,
    },
    -- Motion provider
    { "folke/flash.nvim",
      event = "VeryLazy",
      config = function()
        require("user.plugins._flash").config()
      end,
      keys = require("user.plugins._flash").keys
    },
    --- DOCS: Language
    { "mattn/emmet-vim", ft = frontend_file_types },
    { "aca/emmet-ls", ft = frontend_file_types },
    --- DOCS: Utility
    { "norcalli/nvim-colorizer.lua", event = "VeryLazy" }, --  Display hex colors preview
    { "tpope/vim-repeat", event = "VeryLazy" }, -- Repeat last command by pressing . (dot)
    { "tpope/vim-surround", keys = { "c","d","y" }, event = "VeryLazy" }, -- Change surround brackets, quotes and more
    { "kchmck/vim-coffee-script", event = "BufRead" }, -- Syntax highlight for Coffescript
    { "folke/todo-comments.nvim", -- Highlight TODO, FIXME, etc
      dependencies = { "nvim-lua/plenary.nvim" },
      event = "VeryLazy",
      config = function()
        require("user.plugins._todo_comments").config()
      end,
    },
    -- { "lukas-reineke/indent-blankline.nvim", -- Show indentation guides
    --   event = "BufRead",
    --   config = function()
    --     require("user.plugins._indent").config()
    --   end,
    -- },
    { "zbirenbaum/copilot.lua", -- AI code completion
      cmd = "Copilot",
      event = "BufRead",
      config = function()
        require("copilot").setup({
          suggestion = { enabled = false },
          panel = { enabled = false }
        })
      end
    },
    { "zbirenbaum/copilot-cmp", -- Copilot completion
      dependencies = { "zbirenbaum/copilot.lua" },
      event = "BufRead",
      config = function ()
        require("copilot_cmp").setup()
      end
    },
    { "nvim-neorg/neorg", -- Neorg
      build = ":Neorg sync-parsers",
      ft = { "norg" },
      dependencies = { "nvim-lua/plenary.nvim" },
      lazy = false,
      version = "*",
      config = function()
        require("user.plugins._neorg").config()
      end
    }
  }
end

return M
