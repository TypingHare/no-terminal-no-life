require("config.keymaps")
require("config.lazy")
require("config.transparent")

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local arg = vim.fn.argv()[1]

        -- Open Neo-tree if the first argument is a directory
        if arg and vim.fn.isdirectory(arg) == 1 then
            require("neo-tree.command").execute({
                toggle = true,
                dir = vim.uv.cwd(),
            })
        end

        -- Close the buffer opened for the directory
        vim.schedule(function()
            local bufnr = vim.fn.bufnr(arg)
            if bufnr ~= -1 then
                vim.api.nvim_buf_delete(bufnr, { force = true })
            end
        end)
    end,
})

-- Check if all listed buffers are gone
local function no_real_buffers_open()
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        local buf = vim.bo[bufnr]
        if
            vim.api.nvim_buf_is_loaded(bufnr)
            and buf.buflisted
            and buf.buftype == ""
        then
            return false
        end
    end
    return true
end

-- Auto open dashboard when all buffers are closed
vim.api.nvim_create_autocmd("BufDelete", {
    callback = function()
        vim.schedule(function()
            if no_real_buffers_open() then
                -- Alpha or dashboard plugin
                vim.cmd("Alpha")
                -- Hide bufferline if desired
                vim.opt.showtabline = 0
            end
        end)
    end,
})

-- Show bufferline again when opening a file
vim.api.nvim_create_autocmd("BufAdd", {
    callback = function()
        if vim.bo.buflisted and vim.bo.buftype == "" then
            vim.opt.showtabline = 2
        end
    end,
})

-- Auto-hide bufferline when Alpha is active
vim.api.nvim_create_autocmd("FileType", {
    pattern = "alpha",
    callback = function()
        require("bufferline").setup({
            options = {
                show_bufferline = false,
            },
        })
    end,
})

-- Re-enable bufferline on regular buffers
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        require("bufferline").setup({
            options = {
                show_bufferline = true,
            },
        })
    end,
})
