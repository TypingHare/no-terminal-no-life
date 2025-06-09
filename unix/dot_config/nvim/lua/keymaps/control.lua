-- Save all and quit
km.n {
  key = '<leader>qa',
  action = ':wqa<CR>',
  desc = 'Save All & Quit',
}

-- Forcibly quit Neovim without saving
km.n {
  key = '<leader>qf',
  action = ':qa!<CR>',
  desc = 'Save All & Quit',
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
