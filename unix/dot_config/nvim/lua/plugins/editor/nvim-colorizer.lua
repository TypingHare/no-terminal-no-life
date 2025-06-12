return {
  'norcalli/nvim-colorizer.lua',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('colorizer').setup({
      'css',
      'html',
      'javascript',
      'scss',
      'typescriptreact',
      'javascriptreact',
    }, {
      RGB = true,
      RRGGBB = true,
      names = true,
      css = true,
      css_fn = true,
      mode = 'foreground',
    })
  end,
}
