return {
  'kdheepak/lazygit.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  lazy = true,
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  config = function()
    vim.api.nvim_create_autocmd('TermClose', {
      pattern = '*',
      callback = function(args)
        local buf_ft = vim.bo[args.buf].filetype
        if buf_ft == 'lazygit' then
          require('utils.ui').refresh_neo_tree()
        end
      end,
    })
  end,
}
