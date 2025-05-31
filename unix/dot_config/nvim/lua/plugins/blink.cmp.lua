return {
  {
    'saghen/blink.cmp',
    enabled = true,
    opts = function(_, opts)
      opts.sources.default = { 'lsp' }
    end,
  },
}
