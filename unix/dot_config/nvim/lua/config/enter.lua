-- Show relative line numbers.
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter', 'WinEnter' }, {
  pattern = '*',
  callback = function()
    local ft = vim.bo.filetype
    if vim.bo.buflisted or ft == 'neo-tree' then
      vim.wo.number = false
      vim.wo.relativenumber = false
    else
      vim.wo.number = true
      vim.wo.relativenumber = true
      vim.wo.statuscolumn = [[%s%=%{v:relnum?v:relnum:v:lnum}   ]]
      vim.wo.signcolumn = 'yes'
    end
  end,
})

-- Run the function on events that affect buffer count
vim.api.nvim_create_autocmd({ 'BufAdd', 'BufDelete', 'BufEnter' }, {
  callback = ui.toggle_bufferline,
})

-- Change the color of the vertical line
-- vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', ui.c.HL_ACTIVATE_VERTICAL_BAR)

-- Set line number highlight
vim.api.nvim_set_hl(0, 'LineNr', ui.c.HL_LINE_NUMBER)
vim.api.nvim_set_hl(0, 'CursorLineNr', ui.c.HL_CURSOR_LINE_NUMBER)
