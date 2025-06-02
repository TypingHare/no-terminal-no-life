require('polyglot').add_lang {
  name = 'python',
  patterns = { '*.py' },
  lsp = { tool = 'pyright' },
  linter = { tool = 'ruff' },
}
