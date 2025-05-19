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
  local win = require('neo-tree.sources.manager').get_state('filesystem').winid
  if win and vim.api.nvim_win_is_valid(win) then
    vim.api.nvim_set_current_win(win)
  else
    -- Open it and focus
    vim.cmd('Neotree focus')
  end
end, { desc = 'Focus Neo-tree' })
vim.keymap.set('n', '<leader>c', function()
  vim.cmd('Neotree close')
end, { desc = 'Close Neo-tree' })
