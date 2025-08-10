require('polyglot').add_lang {
  name = 'Rust',
  filetypes = { 'rust' },
  lsp = { tool = 'rust-analyzer' },
  -- linter = { tool = 'clippy' },
  formatter = { tool = 'rustfmt' },
  format_on_save = true,
}
