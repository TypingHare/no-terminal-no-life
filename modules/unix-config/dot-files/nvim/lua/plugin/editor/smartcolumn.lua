-- This plugin shows a colorcolumn only when it’s needed, instead of having it
-- always on.
--
-- [https://github.com/m4xshen/smartcolumn.nvim]

local hare_conf = require 'hare-conf'
local color_column = hare_conf.config.editor.general.color_column

return {
  'm4xshen/smartcolumn.nvim',
  config = true,
  opts = {
    custom_colorcolumn = function()
      local ft = vim.bo.filetype
      -- if vim.tbl_contains(color_column.disabled_filetypes, ft) then
      --   return '8096'
      -- end
      --
      return '80'
    end,
  },
}
