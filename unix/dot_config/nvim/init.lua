-- This is the entry file of Neovim. For aesthetics, this file only imports
-- configuration modules in order.

require 'config.neovide'
require 'config.early'
require 'config.lazy'
require 'config.late'

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'conf',
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true -- prevents breaking in the middle of words
  end,
})
