-- This module provides some useful helper functions for UI operation.

local M = {}

--- UI constants
M.c = require 'constants.ui'

--- Get the size of Neo-tree
M.get_neo_tree_size = function()
  return math.max(
    M.c.NEO_TREE_MIN_WIDTH,
    math.floor(vim.o.columns * M.c.NEO_TREE_WIDTH_MULTIPLIER)
  )
end

--- Resize neo-tree
--- 
--- @param width integer
M.resize_neo_tree = function(width)
  local winid =
    require('neo-tree.sources.manager').get_state('filesystem').winid
  if winid then
    vim.api.nvim_win_set_width(winid, width)
  end
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

--- Toggles bufferline.
---
--- This function close the bufferline if the number of buffers is less than 2;
--- otherwise, open the bufferline.
M.toggle_bufferline = function()
  local buffers = vim.fn.getbufinfo { buflisted = 1 }
  if #buffers < 2 then
    vim.o.showtabline = 0
  else
    vim.o.showtabline = 2
  end
end

--- Closes a buffer.
---
--- @param buf integer The ID of the buffer to close.
M.close_buffer = function(buf)
  local name = vim.api.nvim_buf_get_name(buf)
  local is_modifiable = vim.bo.modifiable
  local is_readonly = vim.bo.readonly

  if is_modifiable and not is_readonly and name ~= '' then
    vim.cmd 'write!'
  end

  require('bufferline.commands').cycle(1)
  vim.cmd('bdelete! ' .. buf)
end

_G.ui = M

return M
