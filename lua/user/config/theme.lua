local M = {}

M.catppuccin_theme = 'mocha'

M.kanagawa = function()
  local kanagawa = require "kanagawa"
  kanagawa.setup {
    undercurl = true,           -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true },
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords
    transparent = false,        -- do not set background color
    dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
    globalStatus = false,       -- adjust window separators highlight for laststatus=3
    colors = {},
    overrides = {},
  }
end

M.catppuccin = function()
  local catppuccin = require "catppuccin"
  catppuccin.setup({
    transparent_background = lvim.transparent_window,
    term_colors = false,
    styles = {
      comments = { "italic", "bold" },
      keywords = { "italic", "bold" },
      loops = {},
      functions = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
      conditionals = { "italic" },
    },
    dim_inactive = {
      enabled = lvim.builtin.global_statusline,
      shade = "dark",
      percentage = 0.15,
    },
    integrations = {
      lsp_trouble = true,
      treesitter = true,
      telescope = true,
      cmp = true,
      which_key = true,
      lightspeed = true,
      nvimtree = {
        transparent_panel = lvim.transparent_window,
      },
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "undercurl" },
          hints = {},
          warnings = { "undercurl" },
          information = {},
        },
      },
    },
  })
end

M.colors = {
  kanagawa_colors = {
    bg = "#16161D",
    bg_alt = "#1F1F28",
    fg = "#DCD7BA",
    red = "#43242B",
    orange = "#FFA066",
    yellow = "#DCA561",
    blue = "#7FB4CA",
    cyan = "#658594",
    violet = "#957FB8",
    magenta = "#938AA9",
    green = "#76946A",
    git = {
      add = "#76946A",
      conflict = "#252535",
      delete = "#C34043",
      change = "#DCA561",
    },
  },
  catppuccin = {
    latte = {
      rosewater = "#f2d5cf",
      flamingo = "#eebebe",
      pink = "#f4b8e4",
      mauve = "#ca9ee6",
      red = "#e78284",
      maroon = "#ea999c",
      peach = "#ef9f76",
      yellow = "#e5c890",
      green = "#a6d189",
      teal = "#81c8be",
      sky = "#99d1db",
      sapphire = "#85c1dc",
      blue = "#8caaee",
      lavender = "#babbf1",
      text = "#c6d0f5",
      subtext1 = "#b5bfe2",
      subtext0 = "#a5adce",
      overlay2 = "#949cbb",
      overlay1 = "#838ba7",
      overlay0 = "#737994",
      surface2 = "#626880",
      surface1 = "#51576d",
      surface0 = "#414559",
      base = "#303446",
      mantle = "#292c3c",
      crust = "#232634",
      git = {
        add = "#ABE9B3",
        change = "#96CDFB",
        delete = "#F28FAD",
        conflict = "#FAE3B0",
      }
    },
    mocha = {
      rosewater = "#F5E0DC",
      flamingo = "#F2CDCD",
      violet = "#DDB6F2",
      pink = "#F5C2E7",
      red = "#F28FAD",
      maroon = "#E8A2AF",
      orange = "#F8BD96",
      yellow = "#FAE3B0",
      green = "#ABE9B3",
      blue = "#96CDFB",
      cyan = "#89DCEB",
      teal = "#B5E8E0",
      lavender = "#C9CBFF",
      white = "#D9E0EE",
      gray2 = "#C3BAC6",
      gray1 = "#988BA2",
      gray0 = "#6E6C7E",
      black4 = "#575268",
      bg_br = "#302D41",
      bg = "#1A1826",
      bg_alt = "#1E1E2E",
      fg = "#D9E0EE",
      black = "#1A1826",
      git = {
        add = "#ABE9B3",
        change = "#96CDFB",
        delete = "#F28FAD",
        conflict = "#FAE3B0",
      }
    }
  }
}

local colors = M.colors.catppuccin[M.catppuccin_theme]

M.mode_color = {
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

M.file_icon_colors = {
  Brown = "#905532",
  Aqua = "#3AFFDB",
  Blue = "#689FB6",
  DarkBlue = "#44788E",
  Purple = "#834F79",
  Red = "#AE403F",
  Beige = "#F5C06F",
  Yellow = "#F09F17",
  Orange = "#D4843E",
  DarkOrange = "#F16529",
  Pink = "#CB6F6F",
  Salmon = "#EE6E73",
  Green = "#8FAA54",
  LightGreen = "#31B53E",
  White = "#FFFFFF",
  LightBlue = "#5fd7ff",
}

return M
