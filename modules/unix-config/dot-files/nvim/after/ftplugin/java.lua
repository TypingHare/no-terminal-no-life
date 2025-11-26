require('hare-conf').fn.editor.set_lang_config('java', {
  treesitter = { name = 'java' },
  lsp = { name = 'jdtls' },
  formatter = { name = 'google_java_format' },
})
