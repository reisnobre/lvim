local M = {}
local _time = os.date "*t"
local kind = require("user.utils.lsp_kind")
local theme = require("user.config.theme")
local colors = theme.colors.catppuccin[theme.catppuccin_theme]
local mode_color = require("user.config.theme").mode_color
local conditions = require("user.builtins.lualine.conditions")
local helpers = require("user.builtins.lualine.helpers")

M.mode = {
  function()
    return helpers.mode()
  end,
  color = function()
    return { bg = mode_color[vim.fn.mode()], fg = colors.bg_br }
  end,
  padding = { left = 0, right = 0 },
}

M.git = {
  "b:gitsigns_head",
  icon = " ",
  cond = conditions.check_git_workspace,
  color = { fg = colors.blue, bg = colors.bg_br },
  padding = 1,
}

M.kubernets = {
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

M.win_number = {
  function()
    local winnr = vim.api.nvim_win_get_number(vim.api.nvim_get_current_win())
    if winnr > 10 then
      winnr = 10
    end
    local win = kind.numbers[winnr]
    return win
  end,
  padding = { left = 1, right = 0 },
  cond = conditions.buffer_not_empty,
  color = { fg = colors.blue, bg = colors.bg_br },
}

M.file_type_icon = {
  function()
    vim.api.nvim_command("hi! LualineFileIconColor guifg=" .. helpers.get_file_icon_color() .. " guibg=" .. colors.bg_br)
    local fname = vim.fn.expand "%:p"
    if string.find(fname, "term://") ~= nil then
      return kind.icons.term
    end
    return helpers.get_file_icon()
  end,
  padding = { left = 1, right = 0 },
  cond = conditions.buffer_not_empty,
  color = "LualineFileIconColor",
  gui = "bold",
}

M.file_name_and_info = {
  function()
    local fname = vim.fn.expand("%:p")
    local ftype = vim.fn.expand("%:e")
    local cwd = vim.api.nvim_call_function("getcwd", {})
    if
      string.find(fname, "term") ~= nil
      and string.find(fname, "lazygit;#toggleterm") ~= nil
      and (vim.fn.has "linux" == 1 or vim.fn.has "mac" == 1)
    then
      local git_repo_cmd = io.popen 'git remote get-url origin | tr -d "\n"'
      local git_repo = git_repo_cmd:read "*a"
      git_repo_cmd:close()
      local git_branch_cmd = io.popen 'git branch --show-current | tr -d "\n"'
      local git_branch = git_branch_cmd:read "*a"
      git_branch_cmd:close()
      return git_repo .. "~" .. git_branch
    end
    local show_name = vim.fn.expand "%:t"
    if #cwd > 0 and #ftype > 0 then
      show_name = fname:sub(#cwd + 2)
    end
    local readonly = ""
    local modified = ""
    if vim.bo.readonly then
      readonly = "  "
    end
    if vim.bo.modified then
      modified = "  "
    end
    return show_name .. readonly .. modified
  end,
  cond = conditions.buffer_not_empty,
  padding = { left = 1, right = 1 },
  color = { fg = colors.fg, gui = "bold", bg = colors.bg_br },
}

M.git_diff = {
  "diff",
  source = helpers.diff_source,
  symbols = { added = "  ", modified = "柳", removed = " " },
  diff_color = {
    added = { fg = colors.git.add, bg = colors.bg },
    modified = { fg = colors.git.change, bg = colors.bg },
    removed = { fg = colors.git.delete, bg = colors.bg },
  },
  color = {},
  cond = nil,
}

M.virtual_env = {
  function()
    local utils = require "lvim.core.lualine.utils"
    if vim.bo.filetype == "python" then
      local venv = os.getenv "CONDA_DEFAULT_ENV"
      if venv then
        return string.format("  (%s)", utils.env_cleanup(venv))
      end
      venv = os.getenv "VIRTUAL_ENV"
      if venv then
        return string.format("  (%s)", utils.env_cleanup(venv))
      end
      return ""
    end
    return ""
  end,
  color = { fg = colors.green },
  cond = conditions.hide_in_width,
}

M.testing_status = {
  provider = function()
    return helpers.testing()
  end,
  enabled = function()
    return helpers.testing() ~= nil
  end,
  hl = {
    fg = colors.fg,
  },
  left_sep = " ",
  right_sep = {
    str = " |",
    hl = { fg = colors.fg },
  }
}

M.using_persistence = {
  provider = function()
    if vim.g.using_persistence then
      return "  |"
    elseif vim.g.using_persistence == false then
      return "  |"
    end
  end,
  enabled = function()
    return helpers.using_session()
  end,
  hl = {
    fg = colors.fg,
  }
}

M.readonly_status = {
  function()
    if not vim.bo.readonly or not vim.bo.modifiable then
      return ""
    end
    return "" -- """
  end,
  color = { fg = colors.red }
}

M.diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = kind.icons.error, warn = kind.icons.warn, info = kind.icons.info, hint = kind.icons.hint },
  cond = conditions.hide_in_width,
}

M.treesitter_status = {
  function()
    if next(vim.treesitter.highlighter.active) then
      return "  "
    end
    return ""
  end,
  padding = 0,
  color = { fg = colors.green },
  cond = conditions.hide_in_width,
}

M.lsp_status = {
  function(msg)
    msg = msg or kind.icons.ls_inactive .. "LS Inactive"
    local buf_clients = vim.lsp.buf_get_clients()
    if next(buf_clients) == nil then
      if type(msg) == "boolean" or #msg == 0 then
        return kind.icons.ls_inactive .. "LS Inactive"
      end
      return msg
    end
    local buf_ft = vim.bo.filetype
    local buf_client_names = {}
    local trim_width = 120
    if lvim.builtin.global_statusline then
      trim_width = 100
    end
    local trim = vim.fn.winwidth(0) < trim_width

    for _, client in pairs(buf_clients) do
      if client.name ~= "null-ls" then
        local _added_client = client.name
        if trim then
          _added_client = string.sub(client.name, 1, 4)
        end
        table.insert(buf_client_names, _added_client)
      end
    end

    -- add formatter
    local formatters = require "lvim.lsp.null-ls.formatters"
    local supported_formatters = {}
    for _, fmt in pairs(formatters.list_registered(buf_ft)) do
      local _added_formatter = fmt
      if trim then
        _added_formatter = string.sub(fmt, 1, 4)
      end
      table.insert(supported_formatters, _added_formatter)
    end
    vim.list_extend(buf_client_names, supported_formatters)

    -- add linter
    local linters = require "lvim.lsp.null-ls.linters"
    local supported_linters = {}
    for _, lnt in pairs(linters.list_registered(buf_ft)) do
      local _added_linter = lnt
      if trim then
        _added_linter = string.sub(lnt, 1, 4)
      end
      table.insert(supported_linters, _added_linter)
    end
    vim.list_extend(buf_client_names, supported_linters)

    return "[ " .. kind.icons.ls_active .. table.concat(buf_client_names, ", ") .. " ]"
  end,
  color = { fg = colors.fg, gui = "bold" },
  cond = conditions.hide_in_width,
}

M.file_position = {
  "location",
  padding = 1,
  color = { fg = colors.orange },
}

M.file_size = {
  function()
    local function format_file_size(file)
      local size = vim.fn.getfsize(file)
      if size <= 0 then
        return ""
      end
      local sufixes = { "b", "k", "m", "g" }
      local i = 1
      while size > 1024 do
        size = size / 1024
        i = i + 1
      end
      return string.format("%.1f%s", size, sufixes[i])
    end
    local file = vim.fn.expand "%:p"
    if string.len(file) == 0 then
      return ""
    end
    return format_file_size(file)
  end,
  cond = conditions.buffer_not_empty,
}

M.file_format = {
  "fileformat",
  fmt = string.upper,
  icons_enabled = true,
  color = { fg = colors.green, gui = "bold" },
  cond = conditions.hide_in_width,
}

M.clock = {
  clock,
  cond = conditions.hide_in_width,
  color = { fg = colors.blue, bg = colors.bg },
}

M.file_scroll = {
  function()
    local current_line = vim.fn.line "."
    local total_lines = vim.fn.line "$"
    local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
  end,
  padding = 0,
  color = { fg = colors.yellow, bg = colors.bg },
  cond = nil,
}

return M
