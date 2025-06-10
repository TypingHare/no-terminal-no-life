-- Bash language support

require('polyglot').add_lang {
  name = 'Bash',
  filetypes = { "sh", "zsh" },
  lsp = { tool = 'bash-language-server' },
  formatter = { tool = 'shfmt' },
  linter = { tool = 'shellcheck' },
  format_on_save = true,
}

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*.zsh', '.zshrc', '.bashrc', '.profile', '.bash_profile' },
  callback = function()
    vim.bo.filetype = 'sh'
  end,
})
