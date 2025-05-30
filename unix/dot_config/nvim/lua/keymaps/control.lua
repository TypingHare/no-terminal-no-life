-- Save all buffers and quit
km.n {
  key = '<leader>q',
  action = ':wqa<CR>',
  desc = 'Save All and Quit',
}

-- Forcibly quit
km.n {
  key = '<leader>Q',
  action = ':qa!<CR>',
  desc = 'Force Quit',
}

-- Unset q: (show command history)
km.n {
  key = 'q:',
  action = '<Nop>',
  noremap = true,
}

km.n {
  key = '<leader>t',
  action = '',
}

-- In terminal, `<Esc>` can
km.t {
  key = '<Esc>',
  action = [[<C-\><C-n>]],
  noremap = true,
}
