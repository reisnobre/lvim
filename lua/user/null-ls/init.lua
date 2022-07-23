local M = {}

M.config = function()
  -- NOTE: By default, all null-ls providers are checked on startup.
  -- If you want to avoid that or want to only set up the provider
  -- when you opening the associated file-type,
  -- then you can use filetype plugins for this purpose.
  -- https://www.lunarvim.org/languages/#lazy-loading-the-formatter-setup
  local status_ok, nls = pcall(require, "null-ls")
  if not status_ok then
    return
  end

  local sources = {
    -- NOTE: npm install -g prettier prettier-plugin-solidity
    nls.builtins.formatting.prettierd.with {
      condition = function(utils)
        return not utils.root_has_file { ".eslintrc", ".eslintrc.js" }
      end,
      prefer_local = "node_modules/.bin",
    },
    nls.builtins.formatting.eslint_d.with {
      condition = function(utils)
        return utils.root_has_file { ".eslintrc", ".eslintrc.js" }
      end,
      prefer_local = "node_modules/.bin",
    },

    nls.builtins.diagnostics.eslint_d.with {
      condition = function(utils)
        return utils.root_has_file { ".eslintrc", ".eslintrc.js" }
      end,
      prefer_local = "node_modules/.bin",
    },
    nls.builtins.code_actions.eslint_d.with {
      condition = function(utils)
        return utils.root_has_file { ".eslintrc", ".eslintrc.js" }
      end,
      prefer_local = "node_modules/.bin",
    },
    nls.builtins.diagnostics.phpmd.with {
      filetypes = { "php" },
      args = { "$FILENAME", "json", "phpmd.rules.xml" },
    },
    nls.builtins.diagnostics.phpstan.with {
      filetypes = { "php" },
      prefer_local = "vendor/bin",
    },
    nls.builtins.diagnostics.phpcs.with {
      filetypes = { "php" },
    }
  }

  -- you can either config null-ls itself
  nls.setup {
    on_attach = require("lvim.lsp").common_on_attach,
    debounce = 150,
    sources = sources,
    save_after_format = false,
  }
end

return M
