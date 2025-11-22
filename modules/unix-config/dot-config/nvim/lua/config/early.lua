-- Leader must be set before lazy.nvim is loaded
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
  callback = function(args)
    local buf = args.buf
    local ft = vim.bo[buf].filetype
    local bt = vim.bo[buf].buftype

    local excluded = {
      ['neo-tree'] = true,
    }

    local is_editable = bt == ''
      and vim.bo[buf].modifiable == true
      and not excluded[ft]

    if is_editable then
      vim.wo.statuscolumn =
        [[%s%=%{v:virtnum == 0 ? (v:relnum ? v:relnum : v:lnum) : ''}   ]]
    else
      vim.wo.statuscolumn = ''
    end
  end,
})

-- Speed up startup time by caching Lua modules
vim.loader.enable()
