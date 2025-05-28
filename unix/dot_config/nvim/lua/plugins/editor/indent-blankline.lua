return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        indent = {
            char = "▕",
            tab_char = "▕",
        },
        scope = { enabled = false },
    },
    config = function()
        require("ibl").setup()
    end,
}
