require('hare-conf').fn.editor.set_lang_config('lua', {
  treesitter = { name = 'lua' },
  lsp = { name = 'lua_language_server' },
  formatter = { name = 'stylua' },
  color_column = { enabled = false },
})
