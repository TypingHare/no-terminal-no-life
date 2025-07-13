require('polyglot').add_lang {
  name = 'systemd',
  filetypes = { 'systemd' },
  lsp = { tool = 'systemd-language-server' },
  linter = { tool = 'systemdlint'},
  format_on_save = true,
}
