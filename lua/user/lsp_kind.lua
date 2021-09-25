local lspkind = {}

local kind_symbols = {
  Class = " ",
  Color = " ",
  Constant = "ﲀ ",
  Constructor = " ",
  Enum = "練",
  EnumMember = " ",
  Event = " ",
  Field = "ﰠ ",
  File = " ",
  Folder = " ",
  Function = " ",
  Interface = " ",
  Keyword = " ",
  Method = "ƒ ",
  Module = " ",
  Operator = " ",
  Property = " ",
  Reference = " ",
  Snippet = " ",
  Struct = " ",
  Text = " ",
  TypeParameter = "  ",
  Unit = "塞",
  Value = " ",
  Variable = " ",
}

function lspkind.cmp_kind(kind)
  return kind_symbols[kind] or ""
end

return lspkind
