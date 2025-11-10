return {
  'folke/neoconf.nvim',
  priority = 1000,
  config = function()
    require('neoconf').setup {
      plugins = {
        jsonls = {
          enabled = true,
          configured_servers_only = false,
        },
      },
    }
  end,
}
