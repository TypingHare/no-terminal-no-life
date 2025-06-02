require('polyglot').add_lang {
  name = 'Kotlin',
  file_extensions = { '.kt' },
  lsp = { tool = 'kotlin-language-server' },
  linter = {
    tool = 'ktlint',
    source = require('null-ls').builtins.diagnostics.ktlint,
  },
  formatter = {
    tool = 'ktlint',
    source = require('null-ls').builtins.formatting.ktlint,
  },
}
