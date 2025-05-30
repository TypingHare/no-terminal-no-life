return {
  'lukas-reineke/virt-column.nvim',
  opts = {
    char = '▏',
    virtcolumn = '81',
    priority = 1,
    highlight = 'VirtColumn',
    exclude = {
      filetypes = require('constants.groups').UNEDITABLE_FILETYPES,
    },
  },
}
