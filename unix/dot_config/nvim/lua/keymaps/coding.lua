-- Create a newline down below
km.i {
  key = '<S-Enter>',
  action = '<ESC>o',
}

-- Create a newline down below
km.n {
  key = '<S-Enter>',
  action = 'o<ESC>',
}

-- Rename an idenifier
km.n {
  key = '<leader>cr',
  action = km.lua 'vim.lsp.buf.rename()',
}
