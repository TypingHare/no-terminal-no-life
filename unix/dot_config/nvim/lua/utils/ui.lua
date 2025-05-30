-- This module stores

local M = {}

M.c = require 'constants.ui'

--- Get the size of Neo-tree
M.get_neo_tree_size = function()
  return math.max(
    M.c.NEO_TREE_MIN_WIDTH,
    math.floor(vim.o.columns * M.c.NEO_TREE_WIDTH_MULTIPLIER)
  )
end

--- Focus editor window
M.focus_editor_window = function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype ~= 'neo-tree' and vim.bo[buf].buftype == '' then
      vim.api.nvim_set_current_win(win)
      return true
    end
  end
  return false
end

_G.ui = M

return M
