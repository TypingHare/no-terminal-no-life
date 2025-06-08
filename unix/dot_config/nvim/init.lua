-- This is the entry file of Neovim. For aesthetics, this file only imports
-- configuration modules in order.

require 'config.neovide'
require 'config.early'
require 'config.lazy'
require 'config.late'
require 'config.enter'

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '.zshrc', '.bashrc', '.profile', '.bash_profile' },
  callback = function()
    vim.bo.filetype = 'sh'
  end,
})
