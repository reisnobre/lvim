local M = {}

M.config = function ()

  lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

  -- Additional Leader bindings for WhichKey
  lvim.builtin.which_key.mappings.s = { ":update<cr>", "QuickSave" }
  lvim.builtin.which_key.mappings.n = { ":NvimTreeToggle<CR>", "Toggle NvimTree" }

  -- WhichKey Telescope
  lvim.builtin.which_key.mappings["f"] = {
    name = "+Telescope",
    p = { "<cmd>Telescope find_files<cr>", "Find files" },
    a = { "<cmd>Telescope live_grep<cr>", "Grep files" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    g = {
      name = "+Git",
      c = { "<cmd>Telescope git_commits<cr>", "Git commits" },
      b = { "<cmd>Telescope git_branches<cr>", "Git branches" },
      s = { "<cmd>Telescope git_status<cr>", "Git status" },
      S = { "<cmd>G<cr>", "Git" }
    }
  }
end

return M
