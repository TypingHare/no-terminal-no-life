require('hare-conf').fn.editor.set_lang_config({ 'sh', 'zsh' }, {
  lsp = { name = 'bashls' },
  linter = { name = 'shellcheck' },
  formatter = { name = 'shfmt' },
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufEnter' }, {
  pattern = { '*.zsh', '.zshrc', '.bashrc', '.profile', '.bash_profile' },
  callback = function()
    vim.bo.filetype = 'sh'
  end,
})
