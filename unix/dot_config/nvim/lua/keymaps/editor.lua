-- Show and focus Neo-tree
km.n {
  key = '<leader>n',
  action = km.run 'Neotree',
  desc = 'Focus Neo-tree',
}

-- Go to definition of the hovered identifier
km.n {
  key = 'gd',
  action = ':= vim.lsp.buf.definition()<CR>',
  desc = 'Go to definition',
}
