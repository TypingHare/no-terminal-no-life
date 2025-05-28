-- This module controls the behaviors of entering Neovim.
--
-- It is assumed that at most one argument, which would be considered as a path.
-- If the path is an existing directory, then Neovim would be initialized in the
-- "directory mode"; otherwise, Neovm would be initialized in the "file mode".
-- If no arguments are passed on, then Neovim would be initialized in the
-- "free mode".

--- Module to handle different modes when entering Neovim.
local M = {}

--- @alias Mode '"FREE"' | '"FILE"' | '"DIRECTORY"'
M.mode = {
    FREE = "FREE",
    FILE = "FILE",
    DIRECTORY = "DIRECTORY",
}

--- @class ModeCallbacks
--- @field FREE fun(file: string|nil)[]
--- @field FILE fun(file: string)[]
--- @field DIRECTORY fun(file: string)[]
M.callbacks = {
    FREE = {},
    FILE = {},
    DIRECTORY = {},
}

--- Launch all callbacks for a given mode.
--- @param mode Mode
--- @param file string|nil
M.launch = function(mode, file)
    for callback in pairs(M.callbacks[mode] or {}) do
        callback(file)
    end
end

--- Bind a callback to a mode.
--- @param mode Mode
--- @param callback fun(file: string|nil)
M.bind = function(mode, callback)
    table.insert(M.callbacks[mode], callback)
end

--- Detect the startup mode based on arguments passed to Neovim.
--- @return Mode mode
--- @return string|nil file
M.detect_mode = function()
    if vim.fn.argc(-1) == 0 then
        return M.mode.FREE, nil
    end

    local file = vim.fn.argv()[1]
    if vim.fn.isdirectory(file) == 1 then
        return M.mode.DIRECTORY, file
    else
        return M.mode.FILE, file
    end
end

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local mode, file = M.detect_mode()
        vim.print("Entering Neovim in the " .. mode:lower() .. " mode...")
        M.launch(mode, file)
    end,
})

return M
