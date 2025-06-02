-- Bash language support

require('polyglot').add_lang {
  name = 'bash',
  patterns = { '*.sh', '*.bash', '*.zsh', '*.fish' },
  lsp = { tool = 'bash-language-server' },
  formatter = { tool = 'shfmt' },
  linter = { tool = 'shellcheck' },
}
