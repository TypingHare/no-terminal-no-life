local M = {}

--- @alias Filter fun(window_object: WindowObject): boolean
--- @alias WindowObject { buffer_id: integer, filetype: string, buftype: string, buflisted: boolean }
--- @alias Config { filtered_filetypes: string[], filtered_buftypes: string[], filter: Filter }

--- Checks if a window_object is acceptable.
---
--- @param window_object WindowObject The window object to check.
--- @return boolean
M.default_filter = function(window_object)
  if window_object.buflisted then
    return true
  end

  local filetype = window_object.filetype
  if vim.tbl_contains(M.config.filtered_filetypes, filetype) then
    return false
  end

  local buftype = window_object.buftype
  if vim.tbl_contains(M.config.filtered_buftypes, buftype) then
    return false
  end

  return true
end

--- @type Config
M.config = {
  filtered_filetypes = {},
  filtered_buftypes = {},
  filter = M.default_filter,
}

--- Set up this module.
---
--- @param opts Config
M.setup = function(opts)
  opts = opts or {}
  M.config = vim.tbl_deep_extend('force', M.config, opts)
end

--- Returns a list of sorted window ids
---
--- @return integer[]
M.get_sorted_window_ids = function()
  local win_ids = vim.api.nvim_list_wins()
  table.sort(win_ids)
  return win_ids
end

--- Gets the info object of a window.
---
--- @param window_id integer The ID of the window.
--- @return WindowObject
M.get_window_object_by_id = function(window_id)
  local buffer_id = vim.api.nvim_win_get_buf(window_id)

  return {
    buffer_id = buffer_id,
    filetype = vim.bo[buffer_id].filetype,
    buftype = vim.bo[buffer_id].buftype,
    buflisted = vim.bo[buffer_id].buflisted,
  }
end

--- Returns a filtered window id list.
---
--- @param filter Filter The filter function.
--- @param window_ids integer[] The window ID list to filter.
--- @return integer[]
M.get_filtered_window_ids = function(filter, window_ids)
  local filtered_window_ids = {}
  for _, window_id in ipairs(window_ids) do
    local window_object = M.get_window_object_by_id(window_id)
    if filter(window_object) then
      table.insert(filtered_window_ids, #filtered_window_ids, window_id)
    end
  end

  return filtered_window_ids
end

--- Gets all candidate windows.
---
--- @return integer[]
M.get_candidate_window_ids = function()
  return M.get_filtered_window_ids(M.config.filter, M.get_sorted_window_ids())
end

M.jump_to_prev_window = function()
  local candidate_window_ids = M.get_candidate_window_ids()
  local current_window_id = vim.api.nvim_get_current_win()

  local target_window_id = nil
  for i = #candidate_window_ids, 1, -1 do
    if candidate_window_ids[i] < current_window_id then
      target_window_id = candidate_window_ids[i]
      break
    end
  end

  -- If no smaller ID found, wrap to the largest
  if not target_window_id then
    target_window_id = candidate_window_ids[#candidate_window_ids]
  end

  -- Jump to the target window
  vim.api.nvim_set_current_win(target_window_id)
end

return M
