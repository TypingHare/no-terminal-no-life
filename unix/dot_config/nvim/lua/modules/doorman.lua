-- This module controls the behaviors of entering Neovim.
--
-- It is assumed that at most one argument, which would be considered as a path.
-- If the path is an existing directory, then Neovim would be initialized in the
-- "directory mode"; otherwise, Neovm would be initialized in the "file mode".
-- If no arguments are passed on, then Neovim would be initialized in the
-- "free mode".

--- Module to handle different modes when entering Neovim.
---@alias Mode '"free"' | '"file"' | '"directory"'
---@alias Event '"VimEnter"' | '"VimLeavePre"'
---@alias DoormanCallback fun(file: string|nil): nil
local M = {}

---@type table<string, table<Mode, DoormanCallback[]>>
M.callbacks = {
  VimEnter = { free = {}, file = {}, directory = {} },
  VimLeavePre = { free = {}, file = {}, directory = {} },
}

--- Launches all callbacks for the given mode and event.
--- @param mode Mode
--- @param event Event
--- @param file string|nil
M.launch = function(mode, event, file)
  if not M.callbacks[event] or not M.callbacks[event][mode] then
    error(
      ('Invalid event (%s) or mode (%s) passed to listen()'):format(event, mode)
    )
  end

  print(#M.callbacks[event][mode])
  for _, callback in ipairs(M.callbacks[event][mode] or {}) do
    callback(file)
  end
end

--- Listens to a callback.
--- @param opts { mode: Mode, event: Event, callback: DoormanCallback }
M.listen = function(opts)
  local mode = opts.mode
  local event = opts.event
  local callback = opts.callback
  table.insert(M.callbacks[event][mode], callback)
end

--- Detects the startup mode based on arguments passed to Neovim.
--- @return Mode mode
--- @return string|nil file
M.detect_mode = function()
  if vim.fn.argc(-1) == 0 then
    return 'free', nil
  end

  local file = vim.fn.argv()[1]
  if vim.fn.isdirectory(file) == 1 then
    return 'directory', file
  else
    return 'file', file
  end
end

vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    local mode, file = M.detect_mode()
    print(mode)
    M.launch(mode, 'VimEnter', file)
  end,
})

vim.api.nvim_create_autocmd('VimLeavePre', {
  callback = function()
    local mode, file = M.detect_mode()
    M.launch(mode, 'VimLeavePre', file)
  end,
})

return M
