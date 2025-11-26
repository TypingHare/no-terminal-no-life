-- This plugin shows a colorcolumn only when it’s needed, instead of having it
-- always on.
--
-- [https://github.com/m4xshen/smartcolumn.nvim]

return {
  'm4xshen/smartcolumn.nvim',
  config = true,
  opts = {
    custom_colorcolumn = function()
      local ft = vim.bo.filetype
      local bt = vim.bo.buftype
      local hare_conf = require 'hare-conf'
      local exclude_buftypes = hare_conf.config.system.buffer.exclude_types
      local exclude_filetypes = hare_conf.config.system.file.exclude_types
      local editor_lang_conf = hare_conf.fn.editor.get_lang_config(ft)

      if
        vim.tbl_contains(exclude_filetypes, ft)
        or vim.tbl_contains(exclude_buftypes, bt)
      then
        return '4096'
      elseif editor_lang_conf.color_column.enabled then
        return tostring(editor_lang_conf.color_column.width)
      else
        return '80'
      end
    end,
  },
}
