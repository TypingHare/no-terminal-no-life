require('polyglot').add_lang {
  name = 'TOML',
  filetypes = { 'toml' },
  lsp = { tool = 'taplo' },
  formatter = { tool = 'prettier' },
  format_on_save = true,
}
