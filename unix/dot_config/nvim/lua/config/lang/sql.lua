require('polyglot').add_lang {
  name = 'SQL',
  filetypes = { 'sql' },
  treesitter = { tool = 'svelte' },
  lsp = { tool = 'sqls' },
  formatter = { tool = 'sqruff' },
  format_on_save = true,
}

require('conform').setup {
  formatters = {
    sqruff = {
      command = 'sqruff',
      args = { 'fix', '-' },
      stdin = true,
    },
  },
}
