-- Save all and quit Neovim
vim.keymap.set(
  'n',
  '<leader>qa',
  ':wa<CR>:qa<CR>',
  { desc = 'Save All & Quit', silent = true }
)

-- Forcibly quit Neovim without saving
vim.keymap.set('n', '<leader>qf', ':qa!<CR>', { desc = 'Quit', silent = true })

----------------------------------- Window -------------------------------------

-- Control window
vim.keymap.set('n', '<leader>w', '<C-W>', { desc = 'Window', silent = true })
