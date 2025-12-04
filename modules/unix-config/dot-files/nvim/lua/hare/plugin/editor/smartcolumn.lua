-- This plugin shows a colorcolumn only when it’s needed, instead of having it
-- always on.
--
-- [https://github.com/m4xshen/smartcolumn.nvim]

return {
  'm4xshen/smartcolumn.nvim',
  config = true,
  opts = {
    custom_colorcolumn = function()
      -- local ft = vim.bo.filetype
      -- local bt = vim.bo.buftype
      -- local hare_conf = require 'hare-conf'
      -- local exclude_buftypes = hare_conf.config.system.buffer.exclude_types
      -- local exclude_filetypes = hare_conf.config.system.file.exclude_types
      -- local editor_lang_conf = hare_conf.fn.editor.get_lang_config(ft)
      --
      -- if
      --   vim.tbl_contains(exclude_filetypes, ft)
      --   or vim.tbl_contains(exclude_buftypes, bt)
      --   or not editor_lang_conf.color_column.enabled
      -- then
      --   return '4096'
      -- else
      --   return tostring(editor_lang_conf.color_column.width or 80)
      -- end
      return '100'
    end,
  },
}
