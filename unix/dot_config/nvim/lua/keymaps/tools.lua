km.n {
  key = '<leader>mh',
  action = [[ :checkhealth <CR> ]],
  desc = 'Check health',
}

-- Show the Lazy panel
km.n {
  key = '<leader>ml',
  action = ':Lazy<CR>',
  desc = 'Show Lazy',
}

-- Show LSP information
km.n {
  key = '<leader>mL',
  action = ':LspInfo<CR>',
  desc = 'Show LSP Info',
}

-- Open Mason
km.n {
  key = '<leader>mm',
  action = ':Mason<CR>',
  desc = 'Open Mason',
}

-- Show Startup Time
km.n {
  key = '<leader>mS',
  action = ':StartupTime<CR>',
  desc = 'Show Startup Time',
}

-- Show the notification history
vim.keymap.set('n', '<leader>h', function()
  require('noice').cmd 'history'
end)

-- Enable copilot.
km.n {
  key = '<leader>mce',
  action = ':Copilot enable<CR>',
  desc = 'Enable Copilot',
}

-- Disable copilot.
km.n {
  key = '<leader>mcd',
  action = ':Copilot disable<CR>',
  desc = 'Disable Copilot',
}
