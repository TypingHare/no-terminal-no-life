-- Show relative line numbers
vim.api.nvim_create_autocmd(
  { 'BufEnter', 'BufWinEnter', 'WinEnter', 'TermOpen', 'BufNewFile' },
  {
    pattern = '*',
    callback = function(args)
      vim.schedule(function()
        if not vim.api.nvim_buf_is_valid(args.buf) then
          return
        end

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

-- vim.api.nvim_create_autocmd('BufWinEnter', {
--   pattern = '*',
--   callback = function()
--     -- Try to move bufferline to the top if it exists
--     local wins = vim.api.nvim_list_wins()
--     for _, win in ipairs(wins) do
--       local buf = vim.api.nvim_win_get_buf(win)
--       local bt = vim.api.nvim_buf_get_option(buf, 'buftype')
--       local ft = vim.api.nvim_buf_get_option(buf, 'filetype')
--       if ft == 'bufferline' or bt == 'nofile' then
--         vim.api.nvim_set_current_win(win)
--         vim.cmd 'wincmd H'
--       end
--     end
--   end,
-- })
