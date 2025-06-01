local runtime_paths = vim.api.nvim_get_runtime_file('', true)
local filtered_runtime_paths = vim.tbl_filter(function(path)
  return not path:find(vim.fn.stdpath 'config', 1, true)
end, runtime_paths)

require('lspconfig').lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = filtered_runtime_paths,
        checkThirdParty = false,
      },
    },
  },
}

-- Automatically format when save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.lua',
  callback = function()
    vim.lsp.buf.format { async = false }
  end,
})

-- Set up the formatter
local null_ls = require 'null-ls'
null_ls.setup {
  sources = {
    null_ls.builtins.formatting.stylua,
  },
}
