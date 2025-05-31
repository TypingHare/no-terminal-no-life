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
