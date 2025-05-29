-- Check if all listed buffers are gone
local function no_real_buffers_open()
  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(bufnr) then
      local buf = vim.bo[bufnr]
      if buf.buflisted and buf.buftype == '' then
        return true
      end
    end
  end

  return false
end

-- Auto open dashboard when all buffers are closed
vim.api.nvim_create_autocmd('BufDelete', {
  callback = function()
    vim.schedule(function()
      local has_real_buffers = no_real_buffers_open()
      if not has_real_buffers then
        vim.cmd 'Dashboard'
        vim.opt.showtabline = 0
      end
    end)
  end,
})

-- Show bufferline again when opening a file
vim.api.nvim_create_autocmd('BufAdd', {
  callback = function()
    if vim.bo.buflisted and vim.bo.buftype == '' then
      vim.opt.showtabline = 2
    end
  end,
})
