return {
    "lukas-reineke/virt-column.nvim",
    config = function()
        require("virt-column").setup({
            char = "▕",
            virtcolumn = "81",
        })

        -- Disable virt-column on some filetypes
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "dashboard", "neo-tree" },
            callback = function()
                require("virt-column").setup({
                    char = "",
                })
            end,
        })
    end,
}
