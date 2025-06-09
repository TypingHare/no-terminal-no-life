-- Disable the vertical column for markdown files.
require('virt-column').update {
  exclude = {
    filetypes = { 'markdown' },
  },
}

require('polyglot').add_lang {
  name = 'markdown',
  patterns = { '*.md', '*.markdown' },
  lsp = { tool = 'marksman' },
  formatter = {
    tool = 'prettier',
    source = require('null-ls').builtins.formatting.prettier.with {
      filetypes = { 'markdown', 'mdx' },
    },
  },
  linter = { tool = 'markdownlint' },
  format_on_save = true,
}
