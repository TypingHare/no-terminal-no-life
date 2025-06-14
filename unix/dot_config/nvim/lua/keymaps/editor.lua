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

km.n {
  key = '<Esc>',
  action = '<Esc>:nohlsearch<CR>',
}

km.n {
  key = '<leader>el',
  action = function()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
  end,
  desc = 'Toggle Relative Line Numbers',
}
