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

-- Rename the idenifier where the cursor is
km.n {
  key = '<leader>cr',
  action = km.lua 'vim.lsp.buf.rename()',
  desc = 'Rename Identifier',
}

km.n {
  key = '<leader>cf',
  action = km.lua 'vim.lsp.buf.format()',
  desc = 'Format File',
}

-- Enable copilot.
km.n {
  key = '<leader>cce',
  action = ':Copilot enable<CR>',
  desc = 'Enable Copilot',
}

-- Disable copilot.
km.n {
  key = '<leader>ccd',
  action = ':Copilot disable<CR>',
  desc = 'Disable Copilot',
}
