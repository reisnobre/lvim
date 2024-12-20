local M = {}
local kind = require("user.utils.lsp_kind")

M.default_diagnostic_config = {
  signs = {
    active = true,
    values = {
      { name = "DiagnosticSignError", text = kind.icons.error },
      { name = "DiagnosticSignWarn", text = kind.icons.warn },
      { name = "DiagnosticSignInfo", text = kind.icons.info },
      { name = "DiagnosticSignHint", text = kind.icons.hint },
    },
  },
  virtual_text = false,
  underline = true,
  severity_sort = true
}

M.config = function ()
  lvim.lsp.document_highlight = false
  lvim.lsp.automatic_servers_installation = false
  if lvim.builtin.lsp_lines then
    M.default_diagnostic_config.virtual_text = false
  end
  vim.diagnostic.config(M.default_diagnostic_config)

  -- add `cucumber_language_server` to `skipped_servers` list
  vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "cucumber_language_server" })

  -- local opts = {
  --   filetypes = {"cucumber", "javascript", "javascriptreact" },
  --   settings = {
  --     cucumber = {
  --       features = {
  --         "cypress/**/*.feature",
  --         "**/*.feature"
  --       },
  --       glue = {
  --         "cypress/**/*.js"
  --       }
  --     }
  --   }
  -- }

  -- require("lvim.lsp.manager").setup("cucumber_language_server", opts)

-- -- lsp_manager.setup("cucumber_language_server", {
-- --   capabilities = require("lvim.lsp").common_capabilities(),
-- --   on_attach = require("lvim.lsp").common_on_attach
-- -- })
  -- remove `jedi_language_server` from `skipped_servers` list
  -- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  --   return server ~= "jedi_language_server"
  -- end, lvim.lsp.automatic_configuration.skipped_servers)
end

return M
