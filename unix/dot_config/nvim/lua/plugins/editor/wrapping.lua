return {
  'andrewferrier/wrapping.nvim',
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('wrapping').setup {
      auto_set_mode_heuristically = true,
      notify_on_switch = false,
    }
  end,
}
