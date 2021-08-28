local M = {}

M.config = function ()
  lvim.plugins = {
    -- { "arcticicestudio/nord-vim" },
    { "christoomey/vim-tmux-navigator" },
    { "tpope/vim-repeat" },
    { "mattn/emmet-vim", ft = {
        "html",
        "css",
        "scss",
        "vue",
        "javascript"
      }
    },
    { "aca/emmet-ls", ft = {
        "html",
        "css",
        "javascript",
        "svelte",
        "vue"
      }
    },
    { "tpope/vim-surround", keys = {
        "c",
        "d",
        "y"
      }
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
		}
  }
end

return M