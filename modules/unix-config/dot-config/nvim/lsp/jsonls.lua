return {
  cmd = { 'json-lsp' },
  filetypes = { 'json', 'jsonc' },
  root_markers = { '.git' },
  settings = {
    json = {
      schemas = {
        require('schemastore').json.schemas(),
        {
          description = 'hare-config schema',
          fileMatch = { 'neoconf.json' },
          url = 'file://'
            .. vim.fn.expand '~/.config/nvim/schemas/hare-config.schema.json',
        },
      },
      validate = { enable = true },
    },
  },
}
