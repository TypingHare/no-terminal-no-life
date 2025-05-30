-- Numbers 1 - 9 can select corresponding buffers
for i = 1, 9 do
  km.n {
    key = '<Enter>' .. i,
    action = '<Cmd>BufferLineGoToBuffer ' .. i .. '<CR>',
    desc = string.format('Go to buffer #%d', i),
  }
end

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
  key = '<Enter>q',
  action = function()
    local buf = vim.api.nvim_get_current_buf()
    local name = vim.api.nvim_buf_get_name(buf)
    local is_modifiable = vim.bo.modifiable
    local is_readonly = vim.bo.readonly

    if is_modifiable and not is_readonly and name ~= '' then
      vim.cmd 'write'
    end

    require('bufferline.commands').cycle(1)
    vim.cmd('bdelete ' .. buf)
  end,
  desc = 'Close Buffer',
}

-- Close all other buffers
km.n {
  key = '<Enter>o',
  action = '<Cmd>BufferLineCloseOthers<CR>',
  desc = 'Close Other Buffers',
}

-- Save the current buffer
km.n {
  key = '<Enter>s',
  action = ':w<CR>',
  desc = 'Save Buffer',
}

-- Hide the bufferline window (buffers are not gone)
km.n {
  key = '<Enter>h',
  action = ':bdelete<CR>',
  desc = 'Hide Bufferline Window',
}
