-- Show LSP information
vim.keymap.set(
  'n',
  '<leader>il',
  ':LspInfo<CR>',
  { desc = 'Show LSP Info', silent = true }
)
