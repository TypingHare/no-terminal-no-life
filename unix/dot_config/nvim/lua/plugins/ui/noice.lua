return {
  'folke/noice.nvim',
  enabled = true,
  event = 'VeryLazy',
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('noice').setup {
      routes = {},
      presets = {
        long_message_to_split = true,
        command_palette = true,
      },
      notify = { enabled = true },
    }
  end,
}
