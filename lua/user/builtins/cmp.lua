local M = {}

M.config = function ()
  local kind = require "user.utils.lsp_kind"
  lvim.builtin.cmp.formatting.kind_icons = kind.cmp_kind
  lvim.builtin.cmp.formatting.source_names = {
    copilot = "(Copilot)",
    buffer = "(Buffer)",
    nvim_lsp = "(LSP)",
    luasnip = "(Snip)",
    treesitter = "",
    nvim_lua = "(NvLua)",
    spell = "暈",
    emoji = "",
    path = "",
    calc = "",
    cmp_tabnine = "ﮧ",
    ["vim-dadbod-completion"] = "𝓐",
  }

  lvim.builtin.cmp.experimental = {
    ghost_text = true,
    native_menu = false,
    custom_menu = true,
  }

  lvim.builtin.cmp.sources = {
    { name = "copilot", max_item_count = 3 },
    { name = "nvim_lsp", max_item_count = 8 },
    { name = "buffer", max_item_count = 3, keyword_length = 5 },
    { name = "path", max_item_count = 3 },
    { name = "luasnip", max_item_count = 5 },
    { name = "nvim_lua" },
    { name = "calc" },
    { name = "emoji" },
    { name = "treesitter" },
    { name = "crates" },
  }
end

return M
