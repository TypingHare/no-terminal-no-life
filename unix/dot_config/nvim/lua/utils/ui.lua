-- This module stores

local M = {}

--- Get the size of Neo-tree
M.get_neo_tree_size = function()
  local constants = require 'constants.ui'
  return math.max(
    constants.NEO_TREE_MIN_WIDTH,
    math.floor(vim.o.columns * constants.NEO_TREE_WIDTH_MULTIPLIER)
  )
end

--- Focus editor window
M.focus_editor_window = function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local ft = vim.api.nvim_buf_get_option(buf, 'filetype')
    local bt = vim.api.nvim_buf_get_option(buf, 'buftype')
    if ft ~= 'neo-tree' and bt == '' then
      vim.api.nvim_set_current_win(win)
      return true
    end
  end
  return false
end

_G.ui = M

return M
