return {
    'nvim-neo-tree/neo-tree.nvim',
    opts = {
        window = {
            mappings = {
                ['n'] = 'add',
                ['e'] = function()
                    vim.cmd('wincmd l')
                end,
            },
        },
    },
}
