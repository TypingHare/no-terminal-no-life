return {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require("noice").setup({
            presets = {
                long_message_to_split = true,
            },
        })
    end,
}
