-- Show and focus Neo-tree
km.n {
  key = '<leader>n',
  action = function()
    vim.cmd 'Neotree focus'
  end,
  desc = 'Focus Neo-tree',
}

-- Show LSP information

vim.keymap.set(
  'n',
  '<leader>il',
  ':LspInfo<CR>',
  { desc = 'Show LSP Info', silent = true }
)
