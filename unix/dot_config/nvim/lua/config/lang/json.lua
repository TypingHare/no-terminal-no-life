require('polyglot').add_lang {
  name = 'JSON',
  filetypes = { "json" },
  lsp = { tool = 'json-lsp' },
  formatter = {
    tool = 'prettier',
  },
  format_on_save = true,
}
