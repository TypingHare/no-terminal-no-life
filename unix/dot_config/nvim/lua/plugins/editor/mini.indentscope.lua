return {
    "echasnovski/mini.indentscope",
    event = "LazyFile",
    opts = {
        symbol = "▏",
        --symbol = "│",
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
                vim.b.miniindentscope_disable = true
            end,
        })
    end,
}
