local framework = require 'utils.framework'

-- Add the absolute path to the lazy.nvim to the runtime path.
-- The runtime path is a list of directories that Neovim searches to find
-- runtime files.
vim.opt.rtp:prepend(framework.get_lazy_path())

framework.import_all_modules 'utils'

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

-- Select a color scheme.
-- TODO: Use GUI to change colorschemes.
vim.cmd.colorscheme 'catppuccin'

-- Make sure that the vertical column has the same style with the indent
-- blanklines for visual coordination.
vim.api.nvim_set_hl(0, 'NonText', ui.c.HL_VERTICAL_BAR)

-- Change the highlight of the cursor.
vim.api.nvim_set_hl(0, 'Cursor', ui.c.HL_CURSOR)

-- Change the highlight of the cursor in the insert mode.
vim.api.nvim_set_hl(0, 'CursorInsert', ui.c.HL_CURSOR_INSERT)

-- Change the highlight of the line numbers.
vim.api.nvim_set_hl(0, 'LineNr', ui.c.HL_LINE_NUMBER)

-- Change the highlight of the cursor line number.
vim.api.nvim_set_hl(0, 'CursorLineNr', ui.c.HL_CURSOR_LINE_NUMBER)

framework.import_all_modules 'keymaps'
