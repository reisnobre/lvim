local M = {}

local prefix = "<leader>"

M.config = function ()
  lvim.keys.insert_mode["jj"] = "<Esc>"

  -- Buffer Navigation
  lvim.keys.normal_mode["<leader><leader>"] = ":Telescope find_files<cr>"
  lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
  lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
  lvim.keys.normal_mode["gr"] = ":Trouble lsp_references<cr>"

  -- Additional Leader bindings for WhichKey
  lvim.builtin.which_key.user = {
    { prefix .. "n", ":NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
    { prefix .. "s", ":update<CR>", desc = "QuickSave" },
    -- Git
    { prefix .. "g", group = "Git" },
    { prefix .. "gs", ":G<CR>", desc = "Fugitive" },
    { prefix .. "ga", ":lua require 'gitsigns'.stage_hunk()<cr>", desc = "State hunk" },
    -- Bufferline
    { prefix .. "b", group = "BufferLine" },
    { prefix .. "bh", cmd = ":BufferLineCloseLeft<cr>", desc = "close all buffers to the left" },
    { prefix .. "bl", cmd = ":BufferLineCloseRight<cr>", desc = "close all buffers to the right" },
    { prefix .. "bj", cmd = ":BufferLinePick<cr>", desc = "jump to a buffer" },
    { prefix .. "bJ", cmd = ":BufferLinePickClose<cr>", desc = "close target buffer" },
    { prefix .. "bt", cmd = ":BufferLineGroupToggle front<CR>", desc = "toggle front tabs" },
    { prefix .. "bT", cmd = ":BufferLineGroupToggle back<CR>", desc = "toggle back tabs" },
    { prefix .. "bD", cmd = ":call delete(expand('%')) | bdelete!<CR>", desc = "Delete current file" },
    { prefix .. "by", cmd = ":let @+ = expand('%')<CR>", desc = "Copy path to current file" },
    -- Telescope
    { prefix .. "f", group = "Telescope" },
    { prefix .. "fp", cmd = ":Telescope find_files<cr>", desc = "Find files" },
    { prefix .. "fa", cmd = ":Telescope live_grep<cr>", desc = "Grep files" },
    { prefix .. "fo", cmd = ":Telescope oldfiles<cr>", desc = "Old files" },
    { prefix .. "fm", cmd = ":Telescope marks<cr>", desc = "Marks" },
    { prefix .. "fb", cmd = ":lua require('user.telescope.custom-finders').curbuf()<cr>", desc = "Current Buffer" },
    { prefix .. "fs", cmd = ":Telescope projects<cr>", desc = "Projects" },
    { prefix .. "fP", cmd = ":lua require('user.telescope.custom-finders').project_search()<cr>", desc = "Project" }, -- Broken

    -- Git Group
    { prefix .. "fgg", cmd = ":lua require('user.telescope.custom-finders').git_files()<cr>", desc = "Git Files" },
    { prefix .. "fgc", cmd = ":Telescope git_commits<cr>", desc = "Git commits"},
    { prefix .. "fgC", cmd = ":Telescope git_bcommits<cr>", desc = "Checkout commit (for current file)"},
    { prefix .. "fgb", cmd = ":Telescope git_branches<cr>", desc = "Git branches"},
    { prefix .. "fgs", cmd = ":lua require('user.telescope.custom-finders').git_status()<cr>", desc = "Git Status"},

    -- LSP Group
    { prefix .. "fla", cmd = ":lua require('user.telescope.custom-finders').code_actions()<CR>", desc = "Code Actions"},

    -- Trouble
    { prefix .. "t", group = "Trouble" },
    { prefix .. "r", cmd = ":Trouble lsp_references<cr>", desc = "References" },
    { prefix .. "f", cmd = ":Trouble lsp_definitions<cr>", desc = "Definitions" },
    { prefix .. "i", cmd = ":Trouble lsp_implementations<cr>", desc = "Implementations" },
    { prefix .. "q", cmd = ":Trouble quickfix<cr>", desc = "QuickFix" },
    { prefix .. "l", cmd = ":Trouble loclist<cr>", desc = "LocationList" },
    { prefix .. "w", cmd = ":Trouble lsp_workspace_diagnostics<cr>", desc = "Diagnostics" },
    -- Spectre
    { prefix .. "R", group = "Spectre" },
    { prefix .. "Rp", cmd = ":lua require('spectre').open()<cr>", desc = "Project" },
    { prefix .. "Rf", cmd = ":lua require('spectre').open_file_search({select_word=true})<cr>", desc = "Current Buffer" },
    { prefix .. "Rw", cmd = ":lua require('spectre').open_visual({select_word=true})<cr>", desc = "Replace Word" },
    -- Neorg
    { prefix .. "o", group = "Neorg" },
    { prefix .. "on", cmd = ":Plug>(neorg.dirman.new-note)", desc = "New note" },
    { prefix .. "oh", cmd = ":Plug>(neorg.esupports.hop.hop-link)", desc = "Jump to Link" },
    { prefix .. "oH", cmd = ":Plug>(neorg.esupports.hop.hop-link.vsplit)", desc = "Open link vsplit" },
    { prefix .. "ot", cmd = ":Neorg toggle-concealer<CR>", desc = "Toggle concealer" },
    { prefix .. "or", cmd = ":Neorg return<CR>", desc = "Return" },
    { prefix .. "oi", cmd = ":Neorg index<CR>", desc = "Index" },
    { prefix .. "ow", cmd = ":Neorg workspace ", desc = "Workspaces" },
    { prefix .. "om", cmd = ":Neorg inject-metadata<CR>", desc = "Inject metadata" },
    { prefix .. "oM", cmd = ":Neorg update-metadata<CR>", desc = "Update metadata" },
    { prefix .. "oS", cmd = ":Neorg generate-workspace-summary<CR>", desc = "Insert summary" },
    { prefix .. "oj", group = "Journal" },
    -- Journal Group
    { prefix .. "ojt", cmd = ":Neorg journal today<CR>", desc = "Today", group = "Journal" },
    { prefix .. "ojy", cmd = ":Neorg journal yesterday<CR>", desc = "Yesterday", group = "Journal" },
    { prefix .. "ojc", cmd = ":Neorg journal custom<CR>", desc = "Custom", group = "Journal" },

    { prefix .. "od", group = "Docs" },
    -- Docs Group
    { prefix .. "odd", cmd = ":help neorg<CR>", desc = "Docs", group = "Docs" },
    { prefix .. "odc", cmd = ":help neorg-cheatsheet<CR>", desc = "Cheatsheet", group = "Docs" },
  }
end

return M
