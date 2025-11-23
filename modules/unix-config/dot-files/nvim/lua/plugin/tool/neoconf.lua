return {
  'folke/neoconf.nvim',
  priority = 1000,
  opts = {
    plugins = {
      jsonls = {
        enabled = false,
      },
    },
  },
  config = true,
}
