local telescope_builtin = require 'telescope.builtin'

km.n {
  key = '<leader>ff',
  action = telescope_builtin.find_files,
  desc = 'Find Files',
}

km.n {
  key = '<leader>fg',
  action = telescope_builtin.live_grep,
  desc = 'Live Grep',
}

km.n {
  key = '<leader>fb',
  action = telescope_builtin.buffers,
  desc = 'Find Buffers',
}

km.n {
  key = '<leader>fh',
  action = telescope_builtin.help_tags,
  desc = 'Help Tags',
}
