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

-- Jump to the cycle previous window
km.n {
  key = '<BS>',
  action = function()
    require('modules.window-cycle').jump_to_prev_window()
  end,
  desc = 'Previous Window',
}

vim.keymap.set('n', '<leader>h', function()
  require('noice').cmd 'history'
end)
