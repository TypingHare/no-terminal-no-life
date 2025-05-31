-- Show and focus Neo-tree
km.n {
  key = '<leader>n',
  action = function()
    vim.cmd 'Neotree focus'
  end,
  desc = 'Focus Neo-tree',
}

-- Show the Lazy panel
km.n {
  key = '<leader>ml',
  action = ':Lazy<CR>',
  desc = 'Show Lazy',
  silent = true,
}

-- Show LSP information
km.n {
  key = '<leader>mL',
  action = ':LspInfo<CR>',
  desc = 'Show LSP Info',
  silent = true,
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
  silent = true,
}
