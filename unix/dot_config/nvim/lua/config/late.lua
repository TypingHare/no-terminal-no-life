local framework = require 'utils.framework'

framework.import_all_modules 'utils'
framework.import_all_modules 'keymaps'
framework.import_all_modules 'config/lang'

-- Set up polyglot
require('polyglot').auto_apply()
require('polyglot').setup_langs()

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
