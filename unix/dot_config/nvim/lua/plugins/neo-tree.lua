return {
    'nvim-neo-tree/neo-tree.nvim',
    opts = {
        window = {
            mappings = {
                ['n'] = 'add',
                ['e'] = function()
                    vim.cmd('wincmd l')
                end,
                ['y'] = function(state)
                    local node = state.tree:get_node()
                    local path = node:get_id()
                    local rel_path = vim.fn.fnamemodify(path, ':.')
                    vim.fn.setreg('+', rel_path)
                    print('Copied relative path: ' .. rel_path)
                end,
            },
        },
    },
}
