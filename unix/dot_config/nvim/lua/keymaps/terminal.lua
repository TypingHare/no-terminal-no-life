-- Open terminal
km.n {
  key = '<leader>tt',
  action = ':terminal<CR>',
  desc = 'Open Terminal',
}

-- In terminal, `<Esc>` can
km.t {
  key = '<Esc>',
  action = [[<C-\><C-n>]],
}

-- Open toggle terminal (direction = float)
km.n {
  key = '<leader>tf',
  action = ':ToggleTerm direction=float<CR>',
  desc = 'Toggle Terminal (float)',
}
