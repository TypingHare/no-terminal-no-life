-- Move to the next buffer in cycles
vim.keymap.set(
  'n',
  '<Tab>',
  ':BufferLineCycleNext<CR>',
  { desc = 'Next Buffer', silent = true }
)

-- Move to the previous buffer in cycles
vim.keymap.set(
  'n',
  '<S-Tab>',
  ':BufferLineCyclePrev<CR>',
  { desc = 'Previous Buffer', silent = true }
)

-- Save all files and close all other buffers
vim.keymap.set('n', '<leader>bo', function()
  vim.cmd 'wa'
  vim.cmd 'BufferLineCloseOthers'
end, { desc = 'Close Other Buffers', silent = true })

-- Save all buffers
vim.keymap.set(
  'n',
  '<leader>bs',
  ':wa<CR>',
  { desc = 'Save All Buffers', silent = true }
)

-- Hide the bufferline window (buffers are not gone)
vim.keymap.set(
  'n',
  '<leader>bh',
  ':bdelete<CR>',
  { desc = 'Hide Bufferline Window', silent = true }
)
