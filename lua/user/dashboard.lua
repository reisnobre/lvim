local M = {}

M.config = function()
  local present, alpha = pcall(require, "alpha")
  local dashboard = require "alpha.themes.dashboard"
  local scratch_file = "~/.config/lvim/lua/scratch.lua"

  if not present then
    return
  end

  local kind = require "user.lsp_kind"

  -- Banner
  local header = {
    type = "text",
    val = lvim.builtin.dashboard.custom_header,
    opts = {
      position = "center",
      hl = "Number",
    },
  }


  -- Date
  local thingy = io.popen 'echo "$(date +%a) $(date +%d) $(date +%b)" | tr -d "\n"'
  local date = thingy:read "*a"
  thingy:close()

  local heading = {
    type = "text",
    val = "╭──────── " .. kind.icons.calendar .. " Today is " .. date .. " ────────╮",
    opts = {
      position = "center",
      hl = "String",
    },
  }

  -- Plugin count
  local handle = io.popen 'fd -d 2 . $HOME"/.local/share/lunarvim/site/pack/packer" | grep pack | wc -l | tr -d "\n" '
  local plugins = handle:read "*a"
  handle:close()

  plugins = plugins:gsub("^%s*(.-)%s*$", "%1")

  local plugin_count = {
    type = "text",
    val = "╰──────── " .. kind.cmp_kind.Module .. " " .. plugins .. " plugins in total ────────╯",
    opts = {
      position = "center",
      hl = "String",
    },
  }

  -- Fortune message
  local fortune = require "alpha.fortune"()
  local footer = {
    type = "text",
    val = fortune,
    opts = {
      position = "center",
      hl = "Comment",
      hl_shortcut = "Comment",
    },
  }

  local buttons = {
    entries = {
      { "<c-r>", kind.cmp_kind.File .. " Recently Used Files", ":Telescope oldfiles<CR>" },
      {
        "SPC p",
        "  Plugins ",
        ":edit ~/.config/lvim/lua/user/plugins.lua<cr>",
      },
      {
        "SPC s",
        "  Scratch",
        "<CMD>edit " .. scratch_file .. " <CR>",
      }
    },
  }

  local section = {
    header = header,
    heading = heading,
    plugin_count = plugin_count,
    buttons = buttons,
    footer = footer,
  }

  dashboard.section.buttons.val = {}

  -- for _, entry in pairs(section.buttons.entries) do
  --   local button = require("alpha.themes.dashboard").button
  --   table.insert(dashboard.section.buttons.val, button(entry[1], entry[2], entry[3]))
  -- end

  dashboard.section.header.val = section.header.val
  dashboard.section.header.opts.hl = section.header.opts.hl
  dashboard.section.footer.val = section.footer.val
  dashboard.section.footer.opts.hl = section.footer.opts.hl

  local opts = {
    layout = {
      { type = "padding", val = 1 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      section.heading,
      section.plugin_count,
      { type = "padding", val = 1 },
      dashboard.section.buttons,
      dashboard.section.footer,
    },
    opts = {
      margin = 5,
    },
  }

  alpha.setup(opts)
end

return M
