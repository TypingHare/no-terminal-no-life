-- Show and focus Neo-tree
km.n {
  key = '<leader>n',
  action = [[ :Neotree <CR> ]],
  desc = 'Focus Neo-tree',
}

-- Create a newline down below
km.i {
  key = '<S-Enter>',
  action = ':<ESC>o',
}

-- Create a newline down below
km.n {
  key = '<S-Enter>',
  action = ':o<ESC>',
}

-- Go to definition of the hovered identifier
km.n {
  key = 'gd',
  action = ':= vim.lsp.buf.definition()<CR>',
  desc = 'Go to definition',
}
