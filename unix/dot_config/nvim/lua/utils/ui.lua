-- This module provides some useful helper functions for UI operation.

local M = {}

--- UI constants
M.c = require 'constants.ui'

--- Gets the width of Neo-tree.
M.get_neo_tree_size = function()
  return math.max(
    M.c.NEO_TREE_MIN_WIDTH,
    math.floor(vim.o.columns * M.c.NEO_TREE_WIDTH_MULTIPLIER)
  )
end

--- Resizes Neo-tree.
---
--- @param width integer
M.resize_neo_tree = function(width)
  -- Resize the Neo-tree window to the specified width immediately
  local winid =
    require('neo-tree.sources.manager').get_state('filesystem').winid
  if winid then
    vim.api.nvim_win_set_width(winid, width)
  end

  -- TODO: Update the Neo-tree configuration to reflect the new width
  -- require('neo-tree.sources.filesystem.commands')
  --     .set_width(
  --       require('neo-tree.sources.manager').get_state('filesystem'),
  --       width
  --     )
end

--- Refreshes Neo-tree.
M.refresh_neo_tree = function()
  require('neo-tree.sources.filesystem.commands').refresh(
    require('neo-tree.sources.manager').get_state 'filesystem'
  )
end

--- Focuses editor window
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
--- This function closes the bufferline if the number of buffers is 0;
--- otherwise, open the bufferline.
M.toggle_bufferline = function()
  local buffers = vim.fn.getbufinfo { buflisted = 1 }
  if #buffers == 0 then
    vim.o.showtabline = 0
  else
    vim.o.showtabline = 2
  end
end

--- Closes a buffer; saves it if it is modifiable.
---
--- @param buf integer The ID of the buffer to close.
M.close_buffer = function(buf)
  local name = vim.api.nvim_buf_get_name(buf)
  local is_modifiable = vim.bo.modifiable
  local is_readonly = vim.bo.readonly

  if is_modifiable and not is_readonly and name ~= '' then
    vim.cmd 'write!'
  end

  -- TODO: Go back to the previous buffer instead
  require('bufferline.commands').cycle(-1)
  vim.cmd('bdelete! ' .. buf)
end

_G.ui = M

return M
