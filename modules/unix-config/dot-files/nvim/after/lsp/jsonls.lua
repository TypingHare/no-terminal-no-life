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
            .. require('lazy.core.config').plugins['hare-conf'].dir
            .. '/schemas/hare-conf.schema.json',
        },
      },
      validate = { enable = true },
    },
  },
}
