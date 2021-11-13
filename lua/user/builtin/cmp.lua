local M = {}

M.config = function ()
  lvim.builtin.cmp.documentation.border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
  lvim.builtin.cmp.formatting.kind_icons = require("user.lsp_kind").symbols()

  lvim.builtin.cmp.experimental = {
    ghost_text = true,
    native_menu = false,
    custom_menu = true,
  }

  lvim.builtin.cmp.sources = {
    { name = "nvim_lsp", max_item_count = 7 },
    { name = "buffer", max_item_count = 3 },
    { name = "path", max_item_count = 5 },
    { name = "luasnip", max_item_count = 3 },
    { name = "nvim_lua" },
    { name = "calc" },
    { name = "emoji" },
    { name = "treesitter" },
    { name = "crates" },
  }

  lvim.builtin.cmp.formatting.source_names = {
    buffer = "(Buffer)",
    nvim_lsp = "(LSP)",
    luasnip = "(Snip)",
    treesitter = " ",
    nvim_lua = "(NvLua)",
    spell = " 暈",
    emoji = "  ",
    path = "  ",
    calc = "  ",
    cmp_tabnine = "  ",
  }

end

return M
