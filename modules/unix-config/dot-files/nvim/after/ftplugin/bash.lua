vim.api.nvim_create_autocmd({ 'BufRead', 'BufEnter' }, {
  pattern = { '*.zsh', '.zshrc', '.bashrc', '.profile', '.bash_profile' },
  callback = function()
    vim.bo.filetype = 'sh'
  end,
})
