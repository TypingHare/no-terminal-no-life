require('polyglot').add_lang {
  name = 'Kotlin',
  filetypes = { 'kotlin' },
  lsp = { tool = 'kotlin-language-server' },
  formatter = { tool = 'ktlint' },
  format_on_save = true,
}
