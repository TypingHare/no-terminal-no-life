-- This is the entry file of Neovim. For aesthetics, this file only imports
-- configuration modules in order.

require 'config.early'
require 'config.lazy'
require 'config.enter'
require 'config.lsp'

-- Delete [No Name] buffers
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    local bufs = vim.api.nvim_list_bufs()
    for _, buf in ipairs(bufs) do
      if
        vim.api.nvim_buf_get_name(buf) == ''
        and vim.api.nvim_buf_is_loaded(buf)
        and vim.bo[buf].buflisted
      then
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end
  end,
})

-- Run the function on events that affect buffer count
vim.api.nvim_create_autocmd({ 'BufAdd', 'BufDelete', 'BufEnter' }, {
  callback = ui.toggle_bufferline,
})

-- Change the color of the vertical line
vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', ui.c.HL_ACTIVATE_VERTICAL_BAR)

vim.api.nvim_set_hl(0, 'LineNr', { fg = '#5c6370' })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#e06c75', bold = true })
