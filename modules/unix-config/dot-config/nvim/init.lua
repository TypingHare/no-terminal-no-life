require 'config.lazy'

vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function(args)
    require('conform').format { bufnr = args.buf }
  end,
})

-- Set the diagnostic settings.
vim.diagnostic.config {
  virtual_text = true,
  update_in_insert = true,
}

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.statuscolumn =
  [[%s%=%{v:virtnum == 0 ? (v:relnum ? v:relnum : v:lnum) : ''}   ]]
vim.opt.signcolumn = 'yes'

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  pattern = '*',
  callback = function(args)
    vim.schedule(function()
      if not vim.api.nvim_buf_is_valid(args.buf) then
        return
      end

      local buf = args.buf
      local ft = vim.bo[buf].filetype
      local bt = vim.bo[buf].buftype
      if not vim.bo[buf].buflisted or ft == 'neo-tree' or bt == 'terminal' then
        vim.wo.statuscolumn = ''
        vim.wo.number = false
        vim.wo.signcolumn = 'no'
      end
    end)
  end,
})

vim.cmd.colorscheme 'catppuccin'
