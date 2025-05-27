return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require("noice").setup({
            cmdline = {
                enabled = true,
                view = "cmdline-popup",
            },
            messages = {
                enabled = true,
            },
            popupmenu = {
                enabled = true,
            },
            notify = { enabled = true },
            lsp = { progress = { enabled = false } },
            markdown = { hover = { enabled = false }, keys = {} },
            health = { checker = true },
            redirect = { view = "popup" },
            commands = {},
            presets = {
                bottom_search = false,
                command_palette = true,
            },
        })

        -- Set Noice as the default notifier
        vim.notify = require("notify")
    end,
}
