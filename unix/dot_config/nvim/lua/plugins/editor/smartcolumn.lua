return {
  'm4xshen/smartcolumn.nvim',
  opts = {
    colorcolumn = '80',
    disabled_filetypes = { 'help', 'text', 'markdown', 'tex', 'conf' },
    custom_colorcolumn = {
      python = { '88' },
    },
    scope = 'file',
    editorconfig = true,
  },
}
