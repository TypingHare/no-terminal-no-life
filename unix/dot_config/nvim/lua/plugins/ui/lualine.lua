return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    init = function()
        vim.g.lualine_laststatus = vim.o.laststatus

        -- Hide the statusline on the starter page
        -- Otherwise, set an empty statusline till Lualine loads
        if vim.fn.argc(-1) == 0 then
            vim.o.laststatus = 0
        else
            vim.o.statusline = " "
        end
    end,
    opts = function()
        local lualine_require = require("lualine_require")
        lualine_require.require = require

        vim.o.laststatus = vim.g.lualine_laststatus

        local opts = {
            options = {
                theme = "auto",
                globalstatus = vim.o.laststatus == 3,
                disabled_filetypes = {
                    statusline = {
                        "dashboard",
                    },
                },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = { "filename" },
                lualine_y = { "location" },
                lualine_z = { "progress" },
            },
        }

        return opts
    end,
}
