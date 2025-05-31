require('mason-lspconfig').setup {
  ensure_installed = { 'lua_ls' },
  automatic_installation = true,
  automatic_enable = false,
}

require('lspconfig').lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
    },
  },
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lua',
  callback = function()
    vim.defer_fn(function()
      if vim.bo.filetype ~= 'lua' then
        return
      end
      print 'Stopping the first LSP client...'
      vim.lsp.stop_client(1, true)
    end, 50)
  end,
})

-- automatically format when save
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
