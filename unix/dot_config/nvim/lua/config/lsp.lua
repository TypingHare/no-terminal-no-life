vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 4 -- Indent by 4 spaces
vim.opt.tabstop = 4 -- A tab is displayed as 4 spaces
vim.opt.softtabstop = 4 -- A tab feels like 4 spaces when editing

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

require 'config.lang.lua'
