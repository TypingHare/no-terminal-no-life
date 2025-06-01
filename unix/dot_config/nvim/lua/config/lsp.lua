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

-- Use typos
require('lspconfig').typos_lsp.setup {
  cmd = { 'typos-lsp', '--config', 'typos.toml' },
  filetypes = { '*' },
}

framework.import_all_modules 'config/lang'
polyglot.apply { 'lua' }
polyglot.setup_langs()
