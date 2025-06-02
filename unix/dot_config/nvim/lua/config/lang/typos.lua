require('polyglot').add_lang {
  name = 'typos',
  patterns = { '*' },
  lsp = {
    tool = 'typos-lsp',
    setup = {
      cmd = { 'typos-lsp', '--config', 'typos.toml' },
      filetypes = { '*' },
    },
  },
}
