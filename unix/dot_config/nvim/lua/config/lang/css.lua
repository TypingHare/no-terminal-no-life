-- CSS language support

require('polyglot').add_lang {
  name = 'CSS',
  filetypes = { 'css' },
  treesitter = { tool = 'css' },
  lsp = { tool = 'css-lsp' },
  formatter = { tool = 'prettier' },
  format_on_save = true,
}
