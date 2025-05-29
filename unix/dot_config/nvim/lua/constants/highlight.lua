-- This module stores highlight group objects for some common scenarios.

--- @type table<string, { fg?: string, bg?: string, bold?: boolean, italic?: boolean, underline?: boolean, undercurl?: boolean }>
return {
  -- Background color
  BACKGROUND = { bg = '#333333' },

  -- Used in `indent-blankline.nvim` and `virt-column.nvim`
  VERTICAL_BAR = { fg = '#313244' },
}
