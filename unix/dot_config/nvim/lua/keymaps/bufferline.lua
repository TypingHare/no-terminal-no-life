-- Move to the cycle next buffer
km.n {
  key = '<Tab>',
  action = '<Cmd>BufferLineCycleNext<CR>',
  desc = 'Next Buffer',
}

-- Move to the cycle previous buffer
km.n {
  key = '<S-Tab>',
  action = '<Cmd>BufferLineCyclePrev<CR>',
  desc = 'Previous Buffer',
}

-- Close the current buffer and focus on the cycle next buffer
km.n {
  key = '<Enter>c',
  action = function()
    local bufnr = vim.api.nvim_get_current_buf()
    require('bufferline.commands').cycle(1)
    vim.cmd('bdelete ' .. bufnr)
  end,
  desc = 'Close Buffer',
}

-- Close all other buffers
km.n {
  key = '<Enter>o',
  action = '<Cmd>BufferLineCloseOthers<CR>',
  desc = 'Previous Buffer',
}

-- Numbers 1 - 9 can select corresponding buffers
for i = 1, 9 do
  km.n {
    key = '<Enter>' .. i,
    action = '<Cmd>BufferLineGoToBuffer ' .. i .. '<CR>',
    desc = string.format('Go to buffer #%d', i),
  }
end
