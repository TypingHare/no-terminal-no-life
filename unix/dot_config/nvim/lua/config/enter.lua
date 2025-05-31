-- Show relative line numbers.
vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  callback = function()
    if vim.bo.buflisted and vim.bo.filetype ~= 'neo-tree' then
      vim.opt_local.number = true
      vim.opt_local.relativenumber = true
      vim.opt_local.statuscolumn = [[%s%=%{v:relnum?v:relnum:v:lnum}   ]]
      vim.opt_local.signcolumn = 'yes'
    end
  end,
})

-- Delete `[No Name]` buffers.
-- TODO: Find all edge cases that can corrupt the buffers.
-- vim.api.nvim_create_autocmd('BufEnter', {
--   callback = function()
--     local bufs = vim.api.nvim_list_bufs()
--     for _, buf in ipairs(bufs) do
--       if
--         vim.api.nvim_buf_get_name(buf) == '' and vim.bo[buf].buflisted
--         and vim.bo[buf].modifiable == 'modifiable'
--       then
--         vim.api.nvim_buf_delete(buf, {})
--       end
--     end
--   end,
-- })

-- Run the function on events that affect buffer count
vim.api.nvim_create_autocmd({ 'BufAdd', 'BufDelete', 'BufEnter' }, {
  callback = ui.toggle_bufferline,
})

-- Change the color of the vertical line
vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', ui.c.HL_ACTIVATE_VERTICAL_BAR)

-- Set line number highlight
vim.api.nvim_set_hl(0, 'LineNr', ui.c.HL_LINE_NUMBER)
vim.api.nvim_set_hl(0, 'CursorLineNr', ui.c.HL_CURSOR_LINE_NUMBER)

-- doorman.listen {
--   mode = 'directory',
--   event = 'VimEnter',
--   callback = function()
--     vim.notify 'Loading session...'
--     require('persistence').load { last = true }
--   end,
-- }
