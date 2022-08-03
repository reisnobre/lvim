local M = {}

local _time = os.date "*t"
local colors = require("user.theme").colors.catppuccin_colors
-- Color table for highlights
local mode_color = {
  n = colors.git.delete,
  i = colors.green,
  v = colors.yellow,
  [""] = colors.blue,
  V = colors.yellow,
  c = colors.cyan,
  no = colors.magenta,
  s = colors.orange,
  S = colors.orange,
  [""] = colors.orange,
  ic = colors.yellow,
  R = colors.violet,
  Rv = colors.violet,
  cv = colors.red,
  ce = colors.red,
  r = colors.cyan,
  rm = colors.cyan,
  ["r?"] = colors.cyan,
  ["!"] = colors.red,
  t = colors.red,
}

local conditions = require("user.lualine.conditions")

local function mode()
  local mod = vim.fn.mode()

  local selector = math.floor(_time.hour / 8) + 1
  local normal_icons = {
    "  ",
    "  ",
    "  ",
  }
  if mod == "n" or mod == "no" or mod == "nov" then
    return normal_icons[selector]
  elseif mod == "i" or mod == "ic" or mod == "ix" then
    local insert_icons = {
      "  ",
      "  ",
      "  ",
    }
    return insert_icons[selector]
  elseif mod == "V" or mod == "v" or mod == "vs" or mod == "Vs" or mod == "cv" then
    local verbose_icons = {
      " 勇",
      "  ",
      "  ",
    }
    return verbose_icons[selector]
  elseif mod == "c" or mod == "ce" then
    local command_icons = {
      "  ",
      "  ",
      "  ",
    }

    return command_icons[selector]
  elseif mod == "r" or mod == "rm" or mod == "r?" or mod == "R" or mod == "Rc" or mod == "Rv" or mod == "Rv" then
    local replace_icons = {
      "  ",
      "  ",
      "  ",
    }
    return replace_icons[selector]
  end
  return normal_icons[selector]
end

M.mode = function ()
  return {
    function()
      return mode()
    end,
    color = function()
      return { bg = mode_color[vim.fn.mode()], fg = colors.bg_br }
    end,
    padding = { left = 0, right = 0 },
  }
end

M.git = function ()
  return {
    "b:gitsigns_head",
    icon = " ",
    cond = conditions.check_git_workspace,
    color = { fg = colors.blue, bg = colors.bg_br },
    padding = 1,
  }
end

M.kubernets = function ()
  return {
    function()
      local utils = require "lvim.core.lualine.utils"
      local filename = vim.fn.expand "%"
      local kube_env = os.getenv "KUBECONFIG"
      local kube_filename = "kubectl-edit"
      if (vim.bo.filetype == "yaml") and (string.sub(filename, 1, kube_filename:len()) == kube_filename) then
        return string.format("⎈  (%s)", utils.env_cleanup(kube_env))
      end
      return ""
    end,
    color = { fg = colors.cyan },
    cond = conditions.hide_in_width,
  }
  
end

return M
