require('polyglot').add_lang {
  name = 'typescript',
  patterns = { '*.js', '*.jsx', '*.ts', '*.tsx' },
  lsp = { tool = 'typescript-language-server' },
  linter = {
    tool = 'eslint-lsp',
  },
  formatter = {
    tool = 'prettier',
    source = require('null-ls').builtins.formatting.prettier.with {
      filetypes = {
        'javascript',
        'typescript',
        'typescriptreact',
        'javascriptreact',
      },
    },
  },
}
