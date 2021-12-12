  local lsp_installer_servers = require("nvim-lsp-installer.servers")
  local _, requested_server = lsp_installer_servers.get_server("tailwindcss")
  local opts = {
    cmd = requested_server._default_options.cmd,
  }

  require("lvim.lsp.manager").setup("tailwindcss", opts)
