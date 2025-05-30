-- Show and focus Neo-tree
km.n {
  key = '<leader>n',
  action = function()
    vim.cmd 'Neotree focus'
  end,
  desc = 'Focus Neo-tree',
}

-- Show LSP information
km.n {
  key = '<leader>ms',
  action = ':LspInfo<CR>',
  desc = 'Show LSP Info',
  silent = true,
}

-- Show the Lazy panel
km.n {
  key = '<leader>ml',
  action = ':Lazy<CR>',
  desc = 'Show Lazy',
  silent = true,
}

-- Show Startup Time
km.n {
  key = '<leader>ms',
  action = ':StartupTime<CR>',
  desc = 'Show Startup Time',
  silent = true,
}
