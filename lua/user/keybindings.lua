local M = {}

M.config = function ()

  lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
  lvim.keys.normal_mode["<leader>rf"] = ":%s,<C-r><C-w>,"
  lvim.keys.normal_mode["<leader>rl"] = ":s,<C-r><C-w>,"

  -- Additional Leader bindings for WhichKey
  lvim.builtin.which_key.mappings.s = { ":update<cr>", "QuickSave" }
  lvim.builtin.which_key.mappings.n = { ":NvimTreeToggle<CR>", "Toggle NvimTree" }
  lvim.builtin.which_key.mappings.T.p = { "<cmd>TSPlaygroundToggle<cr>", "Playground" }

  -- Additional git command
  lvim.builtin.which_key.mappings.g.s = { "<cmd>G<cr>", "Fugitive Git" }

  lvim.builtin.which_key.mappings["f"] = {
    name = "+Telescope",
    p = { "<cmd>Telescope find_files<cr>", "Find files" },
    a = { "<cmd>Telescope live_grep<cr>", "Grep files" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    c = { "<cmd>Telescope colorscheme<cr>", "ColorSchemes" },
    g = {
      name = "+Git",
      c = { "<cmd>Telescope git_commits<cr>", "Git commits" },
      C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)" },
      b = { "<cmd>Telescope git_branches<cr>", "Git branches" },
      s = { "<cmd>Telescope git_status<cr>", "Git status" }
    }
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
end

return M
