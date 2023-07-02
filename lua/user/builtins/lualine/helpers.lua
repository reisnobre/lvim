local M = {}
local _time = os.date "*t"
local kind = require("user.utils.lsp_kind")
local theme = require("user.config.theme")

M.get_file_info = function ()
  return vim.fn.expand "%:t", vim.fn.expand "%:e"
end

M.get_file_icon = function ()
  local icon
  local ok, devicons = pcall(require, "nvim-web-devicons")
  if not ok then
    print "No icon plugin found. Please install 'kyazdani42/nvim-web-devicons'"
    return ""
  end
  local f_name, f_extension = M.get_file_info()
  icon = devicons.get_icon(f_name, f_extension)
  if icon == nil then
    icon = kind.icons.question
  end
  return icon
end

M.get_file_icon_color = function ()
  local f_name, f_ext = M.get_file_info()
  local has_devicons, devicons = pcall(require, "nvim-web-devicons")
  if has_devicons then
    local icon, iconhl = devicons.get_icon(f_name, f_ext)
    if icon ~= nil then
      return vim.fn.synIDattr(vim.fn.hlID(iconhl), "fg")
    end
  end

  local icon = M.get_file_icon():match "%S+"
  for k, _ in pairs(kind.file_icons) do
    if vim.fn.index(kind.file_icons[k], icon) ~= -1 then
      return theme.file_icon_colors[k]
    end
  end
end

M.clock = function ()
  return kind.icons.clock .. os.date "%H:%M"
end

M.diff_source = function ()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

M.testing = function ()
  if vim.g.testing_status == "running" then
    return " "
  end
  if vim.g.testing_status == "fail" then
    return ""
  end
  if vim.g.testing_status == "pass" then
    return " "
  end
  return nil
end

M.using_session = function ()
  return (vim.g.using_persistence ~= nil)
end


M.mode = function ()
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

return M
