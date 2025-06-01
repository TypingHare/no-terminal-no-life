require 'config.lang.lua'
require 'config.lang.python'
require 'config.lang.markdown'

require('mason-tool-installer').setup {
  ensure_installed = {
    'lua-language-server',
    'typos-lsp',
    'stylua',
    'pyright',
    'ruff',
  },
  auto_update = true,
  run_on_start = true,
  debounce_hours = 24,
}
