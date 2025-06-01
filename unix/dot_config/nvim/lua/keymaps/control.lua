-- Save and quit the current window
km.n {
  key = '<leader>q',
  action = ':wq<CR>',
  desc = 'Save and Quit',
}

-- Save all and quit
km.n {
  key = '<leader>Q',
  action = ':wqa!<CR>',
  desc = 'Save all and Quit',
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

-- Jump to the cycle previous window
km.n {
  key = '<BS>',
  action = function()
    require('modules.window-cycle').jump_to_prev_window()
  end,
  desc = 'Previous Window',
}
