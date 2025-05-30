return {
  'folke/persistence.nvim',
  event = 'BufReadPre',
  opts = {
    branch = false,
    -- options = { 'buffers', 'curdir', 'tabpages', 'globals' },
    options = { 'curdir' },
  },
}
