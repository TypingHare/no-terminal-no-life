return {
    "akinsho/bufferline.nvim",
    opts = {
        options = {
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "Neo-tree",
                    highlight = "Directory",
                    text_align = "left",
                    separator = false,
                },
            },
            show_buffer_close_icons = false,
            show_close_icon = false,
            diagnostics = "nvim_lsp",
            always_show_bufferline = true,
        },
    },
}
