return {
    "echasnovski/mini.indentscope",
    opts = {
        symbol = "▏",
        options = { try_as_border = true },
    },
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
                vim.b.miniindentscope_disable = false
            end,
        })

        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = function()
                vim.api.nvim_set_hl(
                    0,
                    "MiniIndentscopeSymbol",
                    { fg = "#56ab91" }
                )
            end,
        })
    end,
}
