require('hare-conf').fn.editor.set_lang_config('json', {
  treesitter = { name = 'json' },
  lsp = { name = 'json-lsp' },
  formatter = { name = 'prettier' },
  color_column = { enabled = false },
})
