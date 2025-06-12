-- HTML language support

require('polyglot').add_lang {
  name = 'HTML',
  filetypes = { 'html' },
  treesitter = { tool = 'html' },
  lsp = { tool = 'html-lsp' },
  formatter = { tool = 'prettier' },
  format_on_save = true,
}
