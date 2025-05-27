return {
    "nvim-neo-tree/neo-tree.nvim",
    config = function()
        require("neo-tree").setup({
            filesystem = {
                filtered_items = {
                    visible = false,
                    hide_dotfiles = true,
                    hide_gitignored = true,
                },
            },
            window = {
                width = 32,
                ---@type table<string, string | { [1]: function, desc: string }>
                mappings = {
                    ["e"] = {
                        function()
                            vim.cmd("wincmd l")
                        end,
                        desc = "Focus editor",
                    },
                    ["y"] = {
                        function(state)
                            local path = state.tree:get_node():get_id()
                            local relative_path = vim.fn.fnamemodify(path, ":.")
                            vim.fn.setreg("+", relative_path)
                            vim.print("Copied relative path: " .. relative_path)
                        end,
                        desc = "Copy relative path",
                    },
                },
            },
        })
    end,
    keys = {
        {
            "<leader>e",
            function()
                vim.cmd("Neotree focus")
            end,
            desc = "Focus Neo-tree",
        },
    },
}
