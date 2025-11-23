-- This plugin shows a colorcolumn only when it’s needed, instead of having it
-- always on.
--
-- [https://github.com/m4xshen/smartcolumn.nvim]
return {
  'm4xshen/smartcolumn.nvim',
  config = true,
  opts = {
    disabled_filetypes = require('hare-config').config.editor.appearance.color_column.disabled_filetypes,
  },
}
