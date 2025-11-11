-- This script automatically checks if lazy.nvim is installed and installs it
-- if not exists.
local lazy_path = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazy_path) then
  local lazy_repo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    lazy_repo,
    lazy_path,
  }
end

-- Prepends the Lazy path to the Neovim runtime path
vim.opt.rtp:prepend(lazy_path)

-- Set up Lazy
require('lazy').setup {
  spec = {
    { import = 'plugins.ui' },
    { import = 'plugins.tool' },
    { import = 'plugins.editor' },
    { import = 'plugins.theme' },
    { import = 'plugins.lang' },
    { dir = '~/hare-config.nvim', name = 'hare.nvim' },
  },
}
