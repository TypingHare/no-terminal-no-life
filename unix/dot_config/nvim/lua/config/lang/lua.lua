local lspconfig = require 'lspconfig'
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
      workspace = { checkThirdParty = false },
    },
  },
}

-- automatically save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.lua',
  callback = function()
    vim.lsp.buf.format { async = false }
  end,
})
