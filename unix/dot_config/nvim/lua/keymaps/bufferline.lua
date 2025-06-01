-- km.n {
--   key = '<CR>',
--   action = function()
--     if vim.bo.filetype == 'qf' then
--       -- fallback to default <CR> behavior
--       vim.api.nvim_feedkeys(
--         vim.api.nvim_replace_termcodes('<CR>', true, false, true),
--         'n',
--         true
--       )
--     end
--   end,
--   desc = 'Handle Enter key in qf',
-- }

-- Numbers 1 - 9 can select corresponding buffers
for i = 1, 9 do
  km.n {
    key = '<Enter>' .. i,
    action = string.format('<Cmd>BufferLineGoToBuffer %d<CR>', i),
    desc = string.format('Go to buffer #%d', i),
    noremap = false,
  }
end

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

-- Close the current buffer and focus on the cycle next buffer
km.n {
  key = '<Enter>q',
  action = function()
    ui.close_buffer(vim.api.nvim_get_current_buf())
  end,
  desc = 'Close Buffer',
}

-- Save all files and close all other buffers
km.n {
  key = '<Enter>o',
  action = function()
    vim.cmd 'wa'
    vim.cmd 'BufferLineCloseOthers'
  end,
  desc = 'Close Other Buffers',
}

-- Save the current buffer
km.n {
  key = '<Enter>s',
  action = km.run 'w',
  desc = 'Save Buffer',
}

-- Save all files
km.n {
  key = '<Enter>W',
  action = km.run 'wa',
  desc = 'Save All Buffers',
}

-- Hide the bufferline window (buffers are not gone)
km.n {
  key = '<Enter>h',
  action = ':bdelete<CR>',
  desc = 'Hide Bufferline Window',
}
