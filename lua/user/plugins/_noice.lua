local M = {}

M.config = function()
  local status_ok, noice = pcall(require, "noice")

  if not status_ok then
    return
  end

  local found, noice_util = pcall(require, "noice.util")
  vim.lsp.handlers["textDocument/signatureHelp"] = noice_util.protect(require("noice.lsp").signature)
  vim.lsp.handlers["textDocument/hover"] = noice_util.protect(require("noice.lsp.hover").on_hover)

  local spinners = require "noice.util.spinners"
  spinners.spinners["mine"] = {
    frames = {
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
      " ",
    },
    interval = 80,
  }
  noice.setup {
    presets = {
      bottom_search = false, -- use a classic bottom cmdline for search
      command_palette = false, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false, -- add a border to hover docs and signature help
    },
    format = {
      spinner = {
        name = "mine",
        hl = "Constant",
      },
    },
    lsp = {
      progress = {
        enabled = true,
        format = {
          { "{data.progress.percentage} ", hl_group = "Comment" },
          { "{spinner} ", hl_group = "NoiceLspProgressSpinner" },
          { "{data.progress.title} ", hl_group = "Comment" },
        },
        format_done = {},
      },
      hover = { enabled = false },
      signature = { enabled = false, auto_open = { enabled = false } },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = false,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    routes = {
      {
        view = "notify",
        filter = { event = "msg_showmode" },
      },
      {
        filter = {
          event = "msg_show",
          find = "%d+L, %d+B",
        },
        view = "mini",
      },
      {
        view = "cmdline_output",
        filter = { cmdline = "^:", min_height = 5 },
        -- BUG: will be fixed after https://github.com/neovim/neovim/issues/21044 gets merged
      },
      {
        filter = { event = "msg_show", kind = "search_count" },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          find = "; before #",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          find = "; after #",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          find = " lines, ",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          find = "go up one level",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          find = "yanked",
        },
        opts = { skip = true },
      },
      {
        filter = { find = "No active Snippet" },
        opts = { skip = true },
      },
      {
        filter = { find = "waiting for cargo metadata" },
        opts = { skip = true },
      },
    },
  }
end

return M
