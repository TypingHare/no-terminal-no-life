return {
    "lukas-reineke/virt-column.nvim",
    config = function()
        require("virt-column").setup({
            char = "▏",
            virtcolumn = "81",
            priority = 1,
        })

        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = function()
                vim.api.nvim_set_hl(0, "ColorColumn", { fg = "#313244" })
            end,
        })

        -- Disable virt-column on some filetypes
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "dashboard" },
            callback = function()
                require("virt-column").setup({
                    char = "",
                })
            end,
        })
    end,
}
