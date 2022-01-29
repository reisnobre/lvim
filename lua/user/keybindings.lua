local M = {}

M.config = function ()
  -- Additional Leader bindings for WhichKey
  lvim.builtin.which_key.mappings.s = { ":update<cr>", "QuickSave" }
  lvim.builtin.which_key.mappings.n = { ":NvimTreeToggle<CR>", "Toggle NvimTree" }
  lvim.builtin.which_key.mappings.T.p = { "<cmd>TSPlaygroundToggle<cr>", "Playground" }

  -- Additional git command
  lvim.builtin.which_key.mappings.g.s = { "<cmd>G<cr>", "Fugitive Git" }
  lvim.builtin.which_key.mappings.g.a = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "State hunk" }

  lvim.builtin.which_key.mappings["b"] = {
		name = "+barbar",
    o = { "<cmd>BufferCloseAllButCurrent<cr>", "close all but current buffer" },
		h = { "<cmd>BufferCloseBuffersLeft<cr>", "close all buffers to the left" },
		l = { "<cmd>BufferCloseBuffersRight<cr>", "close all BufferLines to the right" },
		d = { "<cmd>BufferOrderByDirectory<cr>", "sort BufferLines automatically by directory" },
		L = { "<cmd>BufferOrderByLanguage<cr>", "sort BufferLines automatically by language" },
		b = { "<cmd>Telescope buffers theme=get_ivy<CR>", "buffers" },
		q = { "<cmd>BufferWipeout<cr>", "wipeout buffer" },
	}

  -- Telescope keybindings
  lvim.builtin.which_key.mappings["f"] = {
    name = "+Telescope",
    p = { "<cmd>Telescope find_files<cr>", "Find files" },
    o = { "<cmd>Telescope oldfiles<cr>", "Old files" },
    m = { "<cmd>Telescope marks<cr>", "Marks" },
    f = { "<cmd>lua require('user.telescope.custom-finders').grep_last_search({layout_strategy = \"vertical\"})<cr>", "Last Search" },
    z = { "<cmd>lua require('user.telescope.custom-finders').search_only_certain_files()<cr>", "Certain Filetype" },
    i = { "<cmd>lua require('user.telescope.custom-finders').installed_plugins()<cr>", "Installed Plugins" },
    b = { "<cmd>lua require('user.telescope.custom-finders').curbuf()<cr>", "Current Buffer" },

    a = { "<cmd>Telescope live_grep<cr>", "Grep files" },
    c = { "<cmd>Telescope colorscheme<cr>", "ColorSchemes" },
    s = { "<cmd>Telescope projects<cr>", "Projects" },
    P = { "<cmd>lua require('user.telescope.custom-finders').project_search()<cr>", "Project" }, -- Broken
    g = {
      name = "+Git",
      g = { "<cmd>lua require('user.telescope.custom-finders').git_files()<cr>", "Git Files" },
      c = { "<cmd>Telescope git_commits<cr>", "Git commits" },
      C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)" },
      b = { "<cmd>Telescope git_branches<cr>", "Git branches" },
      s = { "<cmd>lua require('user.telescope.custom-finders').git_status()<cr>", "Git Status" },
    },
    l = {
      name = "+Lsp",
      a = { "<cmd>lua require('user.telescope.custom-finders').code_actions()<CR>", "Code Actions" }
    },
  }

  lvim.builtin.which_key.mappings["t"] = {
    name = "+Trouble",
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
  }

  lvim.builtin.which_key.mappings["T"] = {
    name = "Test",
    f = { "<cmd>TestFile<cr>", "File" },
    n = { "<cmd>TestNearest<cr>", "Nearest" },
    s = { "<cmd>TestSuite<cr>", "Suite" },
  }

  lvim.builtin.which_key.mappings["E"] = {
    name = "Exec",
    j = { "<cmd>TermExec cmd='echo y | rm public/js/dependencies.js; gulp compile-js'<CR>", "Compile-js" }

  }

  lvim.builtin.which_key.mappings["R"] = {
    name = "Replace",
    f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Current Buffer" },
    p = { "<cmd>lua require('spectre').open()<cr>", "Project" },
    w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  }

  lvim.builtin.which_key.mappings["d"] = {
		name = "+dotfiles",
		d = { "<cmd>lua require('user.telescope.custom-finders').find_dotfiles()<CR>", "Find dotfiles" },
		g = { "<cmd>lua require('user.telescope.custom-finders').grep_dotfiles()<CR>", "Grep dotfiles" },
	}
end

M.set_lightspeed_keymaps = function()
  vim.cmd [[
nmap s <Plug>Lightspeed_s
nmap S <Plug>Lightspeed_S
nmap <expr> f reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_f" : "f"
nmap <expr> F reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_F" : "F"
nmap <expr> t reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_t" : "t"
nmap <expr> T reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_T" : "T"
  ]]
end

return M
