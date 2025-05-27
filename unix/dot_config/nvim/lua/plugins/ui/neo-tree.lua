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
                mappings = {
                    ["<space>"] = "toggle_node",
                    ["<cr>"] = "open",
                    ["S"] = "split_with_window_picker",
                    ["s"] = "vsplit_with_window_picker",
                    ["n"] = "add",
                    ["e"] = function()
                        vim.cmd("wincmd l")
                    end,
                    ["y"] = function(state)
                        local node = state.tree:get_node()
                        local path = node:get_id()
                        local rel_path = vim.fn.fnamemodify(path, ":.")
                        vim.fn.setreg("+", rel_path)

                        print("Copied relative path: " .. rel_path)
                    end,
                },
            },
        })
    end,
    keys = {
        { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree" },
    },
}
