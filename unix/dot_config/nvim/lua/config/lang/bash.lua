-- Bash language support

require('polyglot').add_lang {
  name = 'bash',
  patterns = { '*.sh', '*.bash', '*.zsh', '*.fish', '*.bashrc', '*.zshrc' },
  lsp = { tool = 'bash-language-server' },
  formatter = { tool = 'shfmt' },
  linter = { tool = 'shellcheck' },
  format_on_save = true,
}
