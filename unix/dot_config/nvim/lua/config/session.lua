-- Check if session should be handled
-- If no arguments received or the first argument is a file, then the
-- session is not handled
local function should_handle_session()
    local args = vim.fn.argv()
    if #args == 0 then
        return false
    end
    local first = args[1]
    return vim.fn.isdirectory(first) == 1
end

-- Auto-restore session when entering Neovim (no file opened)
vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
        if should_handle_session() then
            vim.notify('Loading last session...')
            require('persistence').load()
        end
    end,
})

-- Auto-save session on quit (but not if just a single file is open)
vim.api.nvim_create_autocmd('VimLeavePre', {
    callback = function()
        if should_handle_session() then
            require('persistence').save()
        end
    end,
})
