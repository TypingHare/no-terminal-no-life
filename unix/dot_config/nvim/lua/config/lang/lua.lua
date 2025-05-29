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

-- Formatter
local null_ls = require 'null-ls'
null_ls.setup {
  sources = {
    null_ls.builtins.formatting.stylua,
  },
}

require('mason-tool-installer').setup {
  ensure_installed = {
    'stylua',
  },
  auto_update = false,
  run_on_start = true,
}
