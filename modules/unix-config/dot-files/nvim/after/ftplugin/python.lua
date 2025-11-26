require('hare-conf').fn.editor.set_lang_config({ 'json' }, {
  treesitter = { name = 'python' },
  lsp = { name = 'pyright' },
  formatter = { enabled = false },
  color_column = { width = 88 },
  tab = { width = 4 },
})

require('conform').setup {
  formatters_by_ft = {
    python = {
      'ruff_fix',
      'ruff_format',
      'ruff_organize_imports',
    },
  },
}
