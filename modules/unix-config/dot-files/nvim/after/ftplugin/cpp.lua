-- filetypes = { 'c', 'cpp', 'make', 'cmake' },
require('hare-conf').fn.editor.set_lang_config('cpp', {
  lsp = { name = 'clangd' },
  formatter = { name = 'clang-format' },
})
