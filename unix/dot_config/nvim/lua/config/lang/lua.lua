require('mason-lspconfig').setup {
  ensure_installed = { 'lua_ls' },
  automatic_installation = true,
  handlers = {
    lua_ls = function()
      require('lspconfig').lua_ls.setup {
        settings = {
          workspace = {
            library = vim.api.nvim_get_runtime_file('', true),
            checkThirdParty = false,
          },
        },
      }
    end,
  },
}

-- automatically format when save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.lua',
  callback = function()
    vim.lsp.buf.format { async = false }
  end,
})

-- Install stylua automatically
require('mason-tool-installer').setup {
  ensure_installed = {
    'stylua',
  },
  auto_update = false,
  run_on_start = true,
}

-- Formatter
local null_ls = require 'null-ls'
null_ls.setup {
  sources = {
    null_ls.builtins.formatting.stylua,
  },
}
