-- C/C++ language support

require('polyglot').add_lang {
  name = 'C/C++',
  filetypes = { 'c', 'cpp', 'make', 'cmake' },
  lsp = { tool = 'clangd' },
  formatter = { tool = 'clang-format' },
  format_on_save = true,
}
