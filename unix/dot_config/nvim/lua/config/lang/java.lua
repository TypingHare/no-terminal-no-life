-- Java language support

require('polyglot').add_lang {
  name = 'Java',
  filetypes = { 'java' },
  treesitter = { tool = 'java' },
  lsp = { tool = 'jdtls' },
  formatter = { tool = 'google_java_format' },
  format_on_save = true,
}
