local framework = require 'utils.framework'

-- Add the absolute path to the lazy.nvim to the runtime path.
-- The runtime path is a list of directories that Neovim searches to find
-- runtime files.
vim.opt.rtp:prepend(framework.get_lazy_path())

-- Set up lazy.vim
require('lazy').setup {
  spec = {
    { import = 'plugins' },
    { import = 'plugins.ui' },
    { import = 'plugins.editor' },
    { import = 'plugins.coding' },
    { import = 'plugins.tool' },
    { import = 'plugins.lang' },
    { import = 'plugins.ui.themes' },
  },
  default = { version = '*' },
}

--- Add local modules
local modules_path = (vim.fn.stdpath 'config') .. '/lua/modules'
vim.opt.rtp:prepend(modules_path)
package.path = package.path
  .. ';'
  .. modules_path
  .. '/?.lua;'
  .. modules_path
  .. '/?/init.lua'

-- Set up window-cycle
require('window-cycle').setup {
  filetypes = { 'neo-tree' },
}

--- Set up polyglot
require 'polyglot'
