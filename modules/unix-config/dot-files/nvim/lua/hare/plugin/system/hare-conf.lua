return {
  'typinghare/hare-conf.nvim',
  config = function()
    require('hare-conf').setup()
    require('hare-conf').apply()
  end,
}
