require('polyglot').add_lang {
  name = 'JSON',
  patterns = { '*.json' },
  lsp = { tool = 'json-lsp' },
  formatter = {
    tool = 'prettier',
    source = require('null-ls').builtins.formatting.prettier.with {
      filetypes = {
        'json',
        'jsonc',
      },
    },
  },
  format_on_save = true,
}
