-- Show relative line numbers
vim.api.nvim_create_autocmd(
  { 'BufEnter', 'BufWinEnter', 'WinEnter', 'TermOpen', 'BufNewFile' },
  {
    pattern = '*',
    callback = function(args)
      vim.schedule(function()
        local ft = vim.bo[args.buf].filetype
        local bt = vim.bo[args.buf].buftype
        if (not vim.bo.buflisted) or ft == 'neo-tree' or bt == 'terminal' then
          vim.wo.statuscolumn = ''
          vim.wo.number = false
          vim.wo.relativenumber = false
        else
          vim.wo.number = true
          vim.wo.relativenumber = true
          vim.wo.statuscolumn = [[%s%=%{v:relnum?v:relnum:v:lnum}   ]]
          vim.wo.signcolumn = 'yes'
        end
      end)
    end,
  }
)

vim.api.nvim_create_autocmd('TermOpen', {
  pattern = '*',
  callback = function()
    vim.cmd 'startinsert'
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
