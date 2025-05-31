-- Default: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Delete some unwanted keybindings
vim.keymap.del('n', '<leader>l')
vim.keymap.del('n', '<leader>L')
vim.keymap.del('n', '<leader>E')

-- Save the file (only for normal mode and insertion mode)
vim.keymap.set('n', '<C-s>', ':w<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>gi', { noremap = true, silent = true })

-- Override `<leader>e`
vim.keymap.del('n', '<leader>e')
vim.keymap.set('n', '<leader>e', function()
    vim.cmd('Neotree focus')
end, { desc = 'Focus Neo-tree' })
