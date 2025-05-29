--- Module for managing FileType autocmd groups in Neovim
local M = {}

--- Predefined filetype groups
---@type table<string, string[]>
M.groups = {
    UNEDITABLE = {
        'lazy',
        'dashboard',
        'neo-tree',
        'notify',
        'help',
    },
}

--- Register an autocmd for a specific filetype group
---@param opts { group?: string, callback: fun(): nil }
M.set = function(opts)
    local group_name = opts.group or 'UNEDITABLE'
    local filetypes = M.groups[group_name]
    if not filetypes then
        vim.notify(
            ('Unknown group name: %s'):format(group_name),
            vim.log.levels.ERROR
        )
        return
    end

    vim.api.nvim_create_autocmd('FileType', {
        pattern = filetypes,
        callback = opts.callback,
    })
end

return M
