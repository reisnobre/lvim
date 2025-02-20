local M = {}

M.config = function ()
  local status_ok, neorg = pcall(require, "neorg")
  local workspaces = {
    notes = "/Users/reisnobre/Notes",
    money = "/Users/reisnobre/Notes/money",
    trm = "/Users/reisnobre/Notes/trm",
    obsidian = "/Users/reisnobre/Obsidian",
  }

  neorg.setup {
    load = {
      ["core.defaults"] = {},
      ["core.summary"] = {},
      ["core.concealer"] = {},
      ["core.pivot"] = {},
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp"
        }
      },
      ["core.dirman"] = {
        config = {
          workspaces = workspaces,
          default_workspace = "notes"
        },
      }
    },
  }
end

return M
