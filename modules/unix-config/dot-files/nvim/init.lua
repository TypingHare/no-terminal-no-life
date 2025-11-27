require 'hare'

vim.api.nvim_create_autocmd('OptionSet', {
  pattern = 'background',
  callback = function()
    vim.schedule(function()
      local hare_conf = require 'hare-conf'
      vim.print(vim.o.background)
      if vim.o.background == 'dark' then
        vim.cmd.colorscheme(
          hare_conf.config.appearance.color_scheme.dark_scheme
        )
      else
        vim.cmd.colorscheme(
          hare_conf.config.appearance.color_scheme.light_scheme
        )
      end
    end)
  end,
})
