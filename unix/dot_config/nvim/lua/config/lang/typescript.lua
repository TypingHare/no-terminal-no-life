require('polyglot').add_lang {
  name = 'TypeScript',
  filetypes = {
    'javascript',
    'typescript',
    'javascriptreact',
    'typescriptreact',
  },
  lsp = { tool = 'typescript-language-server' },
  linter = { tool = 'eslint-lsp' },
  formatter = {
    tool = 'prettier',
  },
  format_on_save = true,
}
