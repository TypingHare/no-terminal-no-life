vim.keymap.set(
  'i',
  '<S-Enter>',
  '<ESC>o',
  { desc = 'Move to Next Line', silent = true }
)

vim.keymap.set(
  'n',
  '<S-Enter>',
  'o<ESC>',
  { desc = 'Move to Next Line', silent = true }
)

----------------------------------- Coding -------------------------------------

-- Format the current file
vim.keymap.set(
  'n',
  '<leader>cf',
  require('conform').format,
  { desc = 'Format File', silent = true }
)

-- Rename the idenifier under the cursor
vim.keymap.set(
  'n',
  '<leader>cr',
  vim.lsp.buf.rename,
  { desc = 'Rename Identifier', silent = true }
)

-- Show diagnostics under the cursor
vim.keymap.set(
  'n',
  '<leader>cd',
  vim.diagnostic.open_float,
  { desc = 'Show Diagnostics', silent = true }
)

-- Go to the definition under the cursor
vim.keymap.set(
  'n',
  'gd',
  require('telescope.builtin').lsp_definitions,
  { desc = 'Go to Definition', silent = true }
)
