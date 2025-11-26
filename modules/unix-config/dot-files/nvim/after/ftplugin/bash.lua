require('hare-conf').fn.editor.set_lang_config('sh', {
  lsp = { name = 'bashls' },
  linter = { name = 'shellcheck' },
  formatter = { name = 'shfmt' },
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*.zsh', '.zshrc', '.bashrc', '.profile', '.bash_profile' },
  callback = function()
    vim.bo.filetype = 'sh'
  end,
})
