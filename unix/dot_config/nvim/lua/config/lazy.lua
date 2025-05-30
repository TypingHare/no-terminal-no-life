local function import_all_modules(dir)
  local config_path = vim.fn.stdpath 'config'
  local scan_dir = config_path .. '/lua/' .. dir

  for _, file in ipairs(vim.fn.readdir(scan_dir)) do
    if file:match '%.lua$' and not file:match '^init%.lua$' then
      local module = dir:gsub('/', '.') .. '.' .. file:gsub('%.lua$', '')
      require(module)
    end
  end
end

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

import_all_modules 'utils'

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

-- Color scheme
vim.cmd.colorscheme 'catppuccin'

-- Keymaps
import_all_modules 'keymaps'
