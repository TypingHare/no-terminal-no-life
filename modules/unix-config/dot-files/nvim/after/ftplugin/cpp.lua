require('hare-conf').fn.editor.set_lang_config(
  { 'c', 'cpp', 'make', 'cmake' },
  {
    lsp = { name = 'clangd' },
    formatter = { name = 'clang-format' },
  }
)
