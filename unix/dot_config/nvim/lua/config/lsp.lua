local lspconfig = require 'lspconfig'
local mason = require 'mason'
local mason_lspconfig = require 'mason-lspconfig'

mason.setup()
mason_lspconfig.setup {
  ensure_installed = {
    'lua_ls',
  },
  automatic_installation = true,
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()
for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
  lspconfig[server].setup {
    capabilities = capabilities,
  }
end

require('mason-tool-installer').setup {
  ensure_installed = {
    'stylua', -- formatter
    'luacheck', -- linter
  },
  auto_update = false,
  run_on_start = true,
}

require 'config.lang.lua'
