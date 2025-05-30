-- Find files
km.n {
  key = '<leader>ff',
  action = ':Telescope find_files<CR>',
  desc = 'Find Files',
}

-- Find old files
km.n {
  key = '<leader>fo',
  action = ':Telescope oldfiles<CR>',
  desc = 'Find Files',
}

-- Since fining old files in very common, we add one more keymap for it
km.n {
  key = '<leader><Enter>',
  action = ':Telescope oldfiles<CR>',
  desc = 'Find Files',
}

-- Live grep
km.n {
  key = '<leader>fg',
  action = ':Telescope live_grep<CR>',
  desc = 'Live Grep',
}

-- Find buffers
km.n {
  key = '<leader>fb',
  action = ':Telescope buffers<CR>',
  desc = 'Find Buffers',
}

-- Find help
km.n {
  key = '<leader>fh',
  action = ':Telescope help_tags<CR>',
  desc = 'Help Tags',
}
