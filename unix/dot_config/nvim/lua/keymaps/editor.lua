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

local function open_current_file()
  local filepath = vim.api.nvim_buf_get_name(0)
  if filepath == '' then
    print 'No file to open'
    return
  end

  -- Run the open command asynchronously so Neovim doesn't freeze
  vim.fn.jobstart { 'open', filepath }
end

km.n {
  key = '<leader>eo',
  action = open_current_file,
  desc = 'Open with OS',
}
