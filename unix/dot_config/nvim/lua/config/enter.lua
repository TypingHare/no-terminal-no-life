-- Show relative line numbers
--Append three spaces after the line numbers
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

-- Remove the tilde in the status column
vim.opt.fillchars:append { eob = ' ' }

-- -- When entering Neovim in the directory mode, open Neo-tree automatically and
-- -- clear the directory buffer
-- doorman.bind(doorman.mode.DIRECTORY, function(dir)
--   require('neo-tree.command').execute {
--     toggle = true,
--     dir = vim.uv.cwd(),
--   }
--
--   -- Close the buffer opened for the directory
--   vim.schedule(function()
--     local bufnr = vim.fn.bufnr(dir)
--     if bufnr ~= -1 then
--       vim.api.nvim_buf_delete(bufnr, { force = true })
--     end
--     vim.cmd 'Neotree show'
--   end)
-- end)

-- doorman.listen {
--   mode = 'directory',
--   event = 'VimEnter',
--   callback = function()
--     vim.notify 'Loading session...'
--     require('persistence').load { last = true }
--   end,
-- }
