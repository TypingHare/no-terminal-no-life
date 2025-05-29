-- Disable Neovim's built-in file explorer (netrw)
-- Must be disabled before lazy.vim is loaded
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Show relative line numbers
-- Append three spaces after the line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.statuscolumn = '%s%=%{v:relnum?v:relnum:v:lnum}   '

-- Clone lazy.nvim if it doesn't exist
local lazy_path = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazy_path) then
  local lazy_repository = 'https://github.com/folke/lazy.nvim.git'
  local stdout = vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=stable',
    lazy_repository,
    lazy_path,
  }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { stdout, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- Add the absolute path to the lazy.nvim to the runtime path
-- The runtime path is a list of directories that Neovim searches to find
-- runtime files
vim.opt.rtp:prepend(lazy_path)

-- Set up lazy.vim
require('lazy').setup {
  spec = {
    { import = 'plugins' },
    { import = 'plugins.ui' },
    { import = 'plugins.editor' },
    { import = 'plugins.coding' },
    { import = 'plugins.lang' },
    { import = 'plugins.ui.themes' },
  },
}

vim.cmd.colorscheme 'catppuccin'
