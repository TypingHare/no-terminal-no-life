return {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require("noice").setup({
            cmdline = {
                enabled = true,
                view = "cmdline_popup",
            },
            messages = {
                enabled = true,
            },
            popupmenu = {
                enabled = true,
            },
            notify = { enabled = true },
        })

        -- Set Noice as the default notifier
        vim.notify = require("notify")
    end,
}
