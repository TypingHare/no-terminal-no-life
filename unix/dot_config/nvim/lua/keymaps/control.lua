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
