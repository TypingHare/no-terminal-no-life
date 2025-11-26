require('hare-conf').fn.editor.set_lang_config('css', {
  treesitter = { name = 'css' },
  lsp = { name = 'cssls' },
  formatter = { name = 'prettier' },
})
