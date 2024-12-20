-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "cucumber_language_server" })

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
