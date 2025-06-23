require('polyglot').add_lang {
  name = 'TOML',
  filetypes = { 'toml' },
  lsp = { tool = 'taplo' },
  formatter = { tool = 'taplo' },
  format_on_save = true,
}
