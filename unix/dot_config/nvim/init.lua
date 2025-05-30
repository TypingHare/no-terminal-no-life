-- This is the entry file of Neovim. For aesthetics, this file only imports
-- configuration modules in order.

require 'config.early'
require 'config.lazy'
require 'config.enter'
require 'config.lsp'

local function toggle_bufferline()
  local buffers = vim.fn.getbufinfo { buflisted = 1 }
  if #buffers <= 1 then
    vim.o.showtabline = 0
  else
    vim.o.showtabline = 2
  end
end

vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    local current = vim.api.nvim_get_current_buf()
    local bufs = vim.api.nvim_list_bufs()
    for _, buf in ipairs(bufs) do
      if
        buf ~= current
        and vim.api.nvim_buf_get_name(buf) == ''
        and vim.api.nvim_buf_is_loaded(buf)
        and vim.bo[buf].buflisted
      then
        print('Deleting ' .. vim.api.nvim_buf_get_name(buf))
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end
  end,
})

-- Run the function on events that affect buffer count
vim.api.nvim_create_autocmd({ 'BufAdd', 'BufDelete', 'BufEnter' }, {
  callback = toggle_bufferline,
})

-- Change the color of the vertical line
vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', ui.c.HL_ACTIVATE_VERTICAL_BAR)
