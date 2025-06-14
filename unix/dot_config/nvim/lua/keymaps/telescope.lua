-- Find files
km.n {
  key = '<leader>ff',
  action = ':Telescope find_files<CR>',
  desc = '(f)ind files',
}

-- Find old files
km.n {
  key = '<leader>fo',
  action = ':Telescope oldfiles<CR>',
  desc = 'find (o)ld files',
}

-- Live grep
km.n {
  key = '<leader>fg',
  action = ':Telescope live_grep<CR>',
  desc = 'live (g)rep',
}

-- Find buffers
km.n {
  key = '<leader>fb',
  action = ':Telescope buffers<CR>',
  desc = 'find (b)uffers',
}

-- Find help
km.n {
  key = '<leader>fh',
  action = ':Telescope help_tags<CR>',
  desc = '(h)elp tags',
}
