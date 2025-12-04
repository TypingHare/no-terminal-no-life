return {
  name = 'hare-conf.nvim',
  dir = '~/hare-conf.nvim',
  config = function()
    local hc = require 'hare-conf'
    hc.setup()
    hc.builtin.apply_config(hc.config)
  end,
  -- 'typinghare/hare-conf.nvim',
  -- config = function()
  --   require('hare-conf').setup()
  --   require('hare-conf').apply()
  -- end,
}
