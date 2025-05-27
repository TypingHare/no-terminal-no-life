return {
    "lukas-reineke/virt-column.nvim",
    config = function()
        -- Global setup
        require("virt-column").setup({
            char = "│",
            virtcolumn = "81",
        })

        -- Disable virt-column on dashboard filetype
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "dashboard" },
            callback = function()
                vim.b["virt_column_enabled"] = false
            end,
        })
    end,
}
