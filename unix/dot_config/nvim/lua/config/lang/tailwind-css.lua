require('polyglot').add_lang {
  name = 'TailwindCSS',
  filetypes = { 'html', 'css', 'scss', 'javascript', 'typescript', 'svelte' },
  lsp = { tool = 'tailwindcss-language-server' },
}
