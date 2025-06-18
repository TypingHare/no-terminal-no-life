-- Show and focus Neo-tree
km.n {
  key = '<leader>n',
  action = km.run 'Neotree',
  desc = 'Focus Neo-tree',
}

km.n {
  key = '<Esc>',
  action = '<Esc>:nohlsearch<CR>',
}

km.n {
  key = '<leader>el',
  action = function()
    vim.opt.relativenumber = not vim.opt.relativenumber:get()
  end,
  desc = 'Toggle Relative Line Numbers',
}

km.n {
  key = 'zr',
  action = require('ufo').openAllFolds,
  desc = 'Open All Folds',
}

km.n {
  key = 'zm',
  action = require('ufo').closeAllFolds,
  desc = 'Close All Folds',
}
