require 'config.lang.lua'

require('mason-tool-installer').setup {
  ensure_installed = {
    'lua-language-server',
    'typos-lsp',
  },
  auto_update = true,
  run_on_start = true,
  debounce_hours = 24,
}

require('mason-tool-installer').setup {
  ensure_installed = {
    'stylua',
  },
  auto_update = true,
  run_on_start = true,
  debounce_hours = 24,
}
