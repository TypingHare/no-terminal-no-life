-- This module stores all the UI settings constants except for highlight groups

return {
  -- Cursor highlight
  HL_CURSOR = { fg = 'NONE', bg = '#6f9ceb' },

  -- CursorInsert highlight
  HL_CURSOR_INSERT = { fg = 'NONE', bg = '#6f9ceb' },

  -- Background highlight
  HL_BACKGROUND = { bg = '#333333' },

  -- The veritical bar character
  -- Used in `indent-blankline` and `virt-column`
  VERTICAL_BAR = '▏',

  -- Vertical bar highlight
  -- Used in `indent-blankline` and `virt-column`
  HL_VERTICAL_BAR = { fg = '#313244' },

  -- Activate vertical bar highlight
  -- Used in `mini.indentscope`
  HL_ACTIVATE_VERTICAL_BAR = { fg = '#56ab91' },

  -- The minimum value of the width of Neo-tree
  -- Used by `utils.ui`
  NEO_TREE_MIN_WIDTH = 32,

  -- The ratio between the width of Neo-tree and the entire screen
  -- Used by `utils.ui`
  NEO_TREE_WIDTH_MULTIPLIER = 0.25,

  -- Line number highlight
  HL_LINE_NUMBER = { fg = '#6c757d' },

  -- Cursor line number highlight
  HL_CURSOR_LINE_NUMBER = { fg = '#6f9ceb', bold = true },
}
