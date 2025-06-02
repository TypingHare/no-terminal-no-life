local runtime_paths = vim.api.nvim_get_runtime_file('', true)
local filtered_runtime_paths = vim.tbl_filter(function(path)
  return path ~= vim.fn.stdpath 'config'
    and path ~= ((vim.fn.stdpath 'config') .. '/lua/modules')
end, runtime_paths)

require('polyglot').add_lang {
  name = 'Lua',
  patterns = { '*.lua' },
  lsp = {
    tool = 'lua-language-server',
    setup = {
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
    },
  },
  formatter = {
    tool = 'stylua',
    source = require('null-ls').builtins.formatting.stylua,
  },
}
