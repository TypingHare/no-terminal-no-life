-- This module stores highlight group objects for some common scenarios.

--- @type table<string, { fg?: string, bg?: string, bold?: boolean, italic?: boolean, underline?: boolean, undercurl?: boolean }>
return {
  -- Background color
  BACKGROUND = { bg = '#333333' },

  -- Used in `indent-blankline` and `virt-column`
  VERTICAL_BAR = { fg = '#313244' },

  -- Used in `mini.indentscope`
  ACTIVATE_VERTICAL_BARE = { fg = '#56ab91' },
}
