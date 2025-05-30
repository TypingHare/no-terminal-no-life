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
}

-- Window control
km.n {
  key = '<leader>w',
  action = '<C-w>',
  desc = 'Window Controls',
}

-- Open terminal
km.n {
  key = '<leader>t',
  action = ':terminal<CR>',
  desc = 'Open Terminal',
}

-- In terminal, `<Esc>` can
km.t {
  key = '<Esc>',
  action = [[<C-\><C-n>]],
}
