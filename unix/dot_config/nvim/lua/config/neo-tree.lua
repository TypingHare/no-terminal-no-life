vim.api.nvim_create_autocmd("VimResized", {
    callback = function()
        vim.api.nvim_create_autocmd("VimResized", {
            callback = function()
                local new_width = math.max(32, math.floor(vim.o.columns * 0.2))
                local winid = require("neo-tree.sources.manager").get_state(
                    "filesystem"
                ).winid
                if winid then
                    vim.api.nvim_win_set_width(winid, new_width)
                end
            end,
        })
    end,
})
