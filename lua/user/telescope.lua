local lsp_kind = require "user.lsp_kind"
local M = {}

M.config = function ()
  lvim.builtin.telescope.defaults.dynamic_preview_title = true
  lvim.builtin.telescope.defaults.path_display = { shorten = 10 }
  lvim.builtin.telescope.defaults.prompt_prefix = "  "
  lvim.builtin.telescope.defaults.selection_caret = " "
  lvim.builtin.telescope.defaults.cache_picker = { num_pickers = 3 }
  lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
  lvim.builtin.telescope.defaults.file_ignore_patterns = {
    "vendor/*",
    "%.lock",
    "__pycache__/*",
    "%.sqlite3",
    "%.ipynb",
    "node_modules/*",
    "%.jpg",
    "%.jpeg",
    "%.png",
    "%.svg",
    "%.otf",
    "%.ttf",
    ".git/",
    "%.webp",
    ".dart_tool/",
    ".github/",
    ".gradle/",
    ".idea/",
    ".settings/",
    ".vscode/",
    "__pycache__/",
    "build/",
    "env/",
    "gradle/",
    "node_modules/",
    "target/",
    "%.pdb",
    "%.dll",
    "%.class",
    "%.exe",
    "%.cache",
    "%.ico",
    "%.pdf",
    "%.dylib",
    "%.jar",
    "%.docx",
    "%.met",
    "smalljre_*/*",
    ".vale/",
    "%.burp",
    "%.mp4",
    "%.mkv",
    "%.rar",
    "%.zip",
    "%.7z",
    "%.tar",
    "%.bz2",
    "%.epub",
    "%.flac",
    "%.tar.gz",
  }

  lvim.builtin.telescope.pickers.live_grep = {
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.9,
      height = 0.85,
      prompt_position = "bottom",
      horizontal = {
        preview_width = function(_, cols, _)
          if cols > 200 then
            return math.floor(cols * 0.6)
          else
            return math.floor(cols * 0.5)
          end
        end,
      },
    },
  }

  lvim.builtin.telescope.pickers.find_files = {
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.9,
      height = 0.9,
      prompt_position = "bottom",
      horizontal = {
        preview_width = function(_, cols, _)
          if cols > 200 then
            return math.floor(cols * 0.6)
          else
            return math.floor(cols * 0.5)
          end
        end,
      },
    },
  }
end

return M
