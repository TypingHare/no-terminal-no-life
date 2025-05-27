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
                width = 48,
                ---@type table<string, boolean | string | { [1]: function, desc: string }>
                mappings = {
                    ["#"] = false,
                    ["<space>"] = false,
                    ["."] = false,
                    ["<"] = false,
                    ["<2-Leftmouse>"] = false,
                    ["<C-b>"] = false,
                    ["<C-f>"] = false,
                    ["<C-x>"] = false,
                    ["<bs>"] = false,
                    ["<cr>"] = false,
                    ["<esc>"] = false,
                    [">"] = false,
                    ["[g"] = false,
                    ["]g"] = false,
                    ["C"] = false,
                    ["D"] = false,
                    ["S"] = false,
                    ["s"] = false,
                    ["t"] = false,
                    ["w"] = false,
                    ["h"] = "close_node",
                    ["l"] = "open",
                    ["e"] = {
                        function()
                            vim.cmd("wincmd l")
                        end,
                        desc = "Focus Editor",
                    },
                    ["y"] = {
                        function(state)
                            local path = state.tree:get_node():get_id()
                            local relative_path = vim.fn.fnamemodify(path, ":.")
                            vim.fn.setreg("+", relative_path)
                            vim.print("Copied relative path: " .. relative_path)
                        end,
                        desc = "Copy Relative Path",
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
