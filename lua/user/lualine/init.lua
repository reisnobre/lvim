local M = {}
local _time = os.date "*t"
local colors = require("user.theme").colors.catppuccin_colors
local conditions = require("user.lualine.conditions")
local components = require("user.lualine.components")

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

M.config = function()

  -- Config
  local config = {
    options = {
      icons_enabled = true,
      -- Disable sections and component separators
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      theme = {
        -- We are going to use lualine_c an lualine_x as left and
        -- right section. Both are highlighted by c theme .  So we
        -- are just setting default looks o statusline
        normal = { c = { fg = colors.fg, bg = colors.bg } },
        inactive = { c = { fg = colors.fg, bg = colors.bg } },
      },
      disabled_filetypes = { "dashboard", "NvimTree", "Outline", "alpha", "vista", "vista_kind", "TelescopePrompt", "terminal" },
      always_divide_middle = true,
      globalstatus = lvim.builtin.global_statusline,
    },
    sections = {
      -- these are to remove the defaults
      lualine_a = {},

      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      -- These will be filled later
      lualine_c = {},
      lualine_x = {},
    },
    inactive_sections = {
      -- these are to remove the defaults
      lualine_a = {},
      lualine_v = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {
        {
          function()
            local selector = math.floor(_time.hour / 8) + 1
            local icns = {
              "  ",
              "  ",
              "  ",
            }
            return icns[selector]
          end,
          color = function()
            return { bg = mode_color[vim.fn.mode()], fg = colors.bg_alt }
          end,
          padding = { left = 0, right = 0 },
        },
        {
          "filename",
          cond = conditions.buffer_not_empty,
          color = { fg = colors.blue, gui = "bold" },
        },
      },
      lualine_x = {},
    },
  }

  -- Inserts a component in lualine_c at left section
  local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
  end

  -- Inserts a component in lualine_x ot right section
  local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
  end

  -- Mode
  ins_left(components.mode)

  -- Git info
  ins_left(components.git)

  -- Window number
  ins_left(components.win_number)

  -- File icon type
  ins_left(components.file_type_icon)

  -- File read info
  ins_left(components.file_name_and_info)

  -- Diff
  ins_left(components.git_diff)

  ins_right(components.readonly_status)

  -- Diagnostics
  ins_right(components.diagnostics)

  -- Treesitter
  ins_right(components.treesitter_status)

  -- Lsp status
  ins_right(components.lsp_status)

  --- Position
  ins_right(components.file_position)

  -- Scroll
  ins_right(components.file_scroll)

  -- Now don't forget to initialize lualine
  lvim.builtin.lualine.options = config.options
  lvim.builtin.lualine.sections = config.sections
  lvim.builtin.lualine.inactive_sections = config.inactive_sections
end

return M
