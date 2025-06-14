-- Move to the cycle next buffer
km.n {
  key = '<Tab>',
  action = km.run 'BufferLineCycleNext',
  desc = 'Next Buffer',
}

-- Move to the cycle previous buffer
km.n {
  key = '<S-Tab>',
  action = km.run 'BufferLineCyclePrev',
  desc = 'Previous Buffer',
}

-- Numbers 1 - 9 can select corresponding buffers
for i = 1, 9 do
  km.n {
    key = '<leader>b' .. i,
    action = string.format('<Cmd>BufferLineGoToBuffer %d<CR>', i),
    desc = string.format('Go to buffer #%d', i),
    noremap = false,
  }
end

-- Close the current buffer and focus on the cycle next buffer
km.n {
  key = '<leader>bq',
  action = function()
    ui.close_buffer(vim.api.nvim_get_current_buf())
  end,
  desc = 'Close Buffer',
}

-- Save all files and close all other buffers
km.n {
  key = '<leader>bo',
  action = function()
    vim.cmd 'wa'
    vim.cmd 'BufferLineCloseOthers'
  end,
  desc = 'Close Other Buffers',
}

-- Save all buffers
km.n {
  key = '<leader>bs',
  action = km.run 'wa',
  desc = 'Save All Buffers',
}

-- Hide the bufferline window (buffers are not gone)
km.n {
  key = '<leader>bh',
  action = ':bdelete<CR>',
  desc = 'Hide Bufferline Window',
}
