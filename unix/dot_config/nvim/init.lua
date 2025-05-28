require("config.keymaps")
require("config.lazy")
require("config.neo-tree")

-- TODO: Improve it
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local arg = vim.fn.argv()[1]

        -- Open Neo-tree if the first argument is a directory
        if arg and vim.fn.isdirectory(arg) == 1 then
            require("neo-tree.command").execute({
                toggle = true,
                dir = vim.uv.cwd(),
            })

            -- Close the buffer opened for the directory
            -- Also show the Neotree
            vim.schedule(function()
                local bufnr = vim.fn.bufnr(arg)
                if bufnr ~= -1 then
                    vim.api.nvim_buf_delete(bufnr, { force = true })
                end
                vim.cmd("Neotree show")
            end)
        end
    end,
})

-- Check if all listed buffers are gone
local function no_real_buffers_open()
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(bufnr) then
            local buf = vim.bo[bufnr]
            if buf.buflisted and buf.buftype == "" then
                return true
            end
        end
    end

    return false
end

-- Auto open dashboard when all buffers are closed
vim.api.nvim_create_autocmd("BufDelete", {
    callback = function()
        vim.schedule(function()
            local has_real_buffers = no_real_buffers_open()
            if not has_real_buffers then
                vim.cmd("Dashboard")
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
