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
    { import = 'plugins.lang' },
    { import = 'plugins.ui.themes' },
  },
  default = { version = '*' },
}

--- Set up window-cycle
require('modules.window-cycle').setup {
  filetypes = { 'neo-tree' },
}
