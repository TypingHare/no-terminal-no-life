require('polyglot').add_lang {
  name = 'python',
  patterns = { '*.py' },
  lsp = { tool = 'pyright' },
  linter = { tool = 'ruff' },
  format_on_save = true,
}
require('lspconfig').ruff.setup {}
