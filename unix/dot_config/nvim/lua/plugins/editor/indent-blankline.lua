return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    init = function()
        vim.api.nvim_create_autocmd("FileType", {
            pattern = {
                "dashboard",
                "help",
                "lazy",
                "mason",
                "neo-tree",
                "notify",
            },
            callback = function()
                vim.b.indent_blankline_enabled = false
            end,
        })
    end,
    config = function()
        require("ibl").setup({
            indent = {
                char = "▏",
                tab_char = "▏",
            },
            scope = { enabled = false },
        })
    end,
}
