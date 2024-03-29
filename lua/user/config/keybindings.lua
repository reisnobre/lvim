local M = {}

M.config = function ()
  lvim.keys.insert_mode["jj"] = "<Esc>"

  -- Buffer Navigation
  lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
  lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

  -- Additional Leader bindings for WhichKey
  lvim.builtin.which_key.mappings.s = { ":update<cr>", "QuickSave" }
  lvim.builtin.which_key.mappings.n = { ":NvimTreeToggle<CR>", "Toggle NvimTree" }
  lvim.builtin.which_key.mappings.T.p = { "<cmd>TSPlaygroundToggle<cr>", "Playground" }


  -- Additional git command
  lvim.builtin.which_key.mappings.g.s = { "<cmd>G<cr>", "Fugitive Git" }
  lvim.builtin.which_key.mappings.g.a = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "State hunk" }


  lvim.builtin.which_key.mappings["b"] = {
    name = "+bufferline",
    h = { "<cmd>BufferLineCloseLeft<cr>", "close all buffers to the left" },
    l = { "<cmd>BufferLineCloseRight<cr>", "close all BufferLines to the right" },
    j = { ":BufferLinePick<cr>", "jump to a buffer" },
    J = { ":BufferLinePickClose<cr>", "close target buffer" },
    t = { ":BufferLineGroupToggle front<CR>", "toggle front tabs" },
    T = { ":BufferLineGroupToggle back<CR>", "toggle back tabs" },
    D = { ":call delete(expand('%')) | bdelete!<CR>", "Delete current file" },
  }

  -- Telescope keybindings
  lvim.builtin.which_key.mappings["f"] = {
    name = "+Telescope",
    p = { "<cmd>Telescope find_files<cr>", "Find files" },
    a = { "<cmd>Telescope live_grep<cr>", "Grep files" },
    o = { "<cmd>Telescope oldfiles<cr>", "Old files" },
    m = { "<cmd>Telescope marks<cr>", "Marks" },
    b = { "<cmd>lua require('user.telescope.custom-finders').curbuf()<cr>", "Current Buffer" },
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

  lvim.builtin.which_key.mappings["R"] = {
    name = "Replace",
    p = { "<cmd>lua require('spectre').open()<cr>", "Project" },
    f = { "<cmd>lua require('spectre').open_file_search({select_word=true})<cr>", "Current Buffer" },
    w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  }

  lvim.builtin.which_key.mappings["r"] = {
    name = "File Replace",
    f = { ":%s,<C-r><C-w>,", "Replace word under cursor on file" },
    l = { ":s,<C-r><C-w>,", "Replace word under cursor in line" },
  }


  lvim.builtin.which_key.mappings["d"] = {
    name = "+dotfiles",
    d = { "<cmd>lua require('user.telescope.custom-finders').find_dotfiles()<CR>", "Find dotfiles" },
    g = { "<cmd>lua require('user.telescope.custom-finders').grep_dotfiles()<CR>", "Grep dotfiles" },
  }

  lvim.builtin.which_key.mappings["P"] = {
    name = "+Phpactor",
    c = {
      name = "+Class",
      e = { ":PhpactorClassExpand<CR>", "Phpactor class expand" },
      i = { ":PhpactorClassInflect<CR>", "Phpactor class inflect" },
      n = { ":PhpactorClassNew<CR>", "Phpactor class new" }
    }
  }
end

return M
