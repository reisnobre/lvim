local M = {}

M.config = function ()

  vim.g.indentLine_enabled = 1
  vim.g.indent_blankline_show_trailing_blankline_indent = false
  vim.g.indent_blankline_show_first_indent_level = true
  vim.g.indent_blankline_use_treesitter = true
  vim.g.indent_blankline_show_current_context = true
  vim.g.indent_blankline_char = "▏"

  vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile", "dashboard", "fugitive" }

  vim.g.indent_blankline_filetype_exclude = {
    "NvimTree",
    "Trouble",
    "dashboard",
    "fugitive",
    "help",
    "lsp-installer",
    "lspinfo",
    "neogitstatus",
    "packer",
    "startify",
    "terminal",
  }
  -- vim.g.indent_blankline_char = "│"
  vim.g.indent_blankline_context_patterns = {
    "class",
    "return",
    "function",
    "method",
    "^if",
    "^while",
    "jsx_element",
    "^for",
    "^object",
    "^table",
    "block",
    "arguments",
    "if_statement",
    "else_clause",
    "jsx_element",
    "jsx_self_closing_element",
    "try_statement",
    "catch_clause",
    "import_statement",
    "operation_type",
  }
  -- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
  vim.wo.colorcolumn = "99999"
end

return M
