require('polyglot').add_lang {
  name = 'Svelte',
  filetypes = { 'svelte' },
  treesitter = { tool = 'svelte' },
  lsp = { tool = 'svelte-language-server' },
  formatter = {
    tool = 'prettier',
  },
  format_on_save = true,
}
