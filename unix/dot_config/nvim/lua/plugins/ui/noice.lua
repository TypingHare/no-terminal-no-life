return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('noice').setup {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      presets = {
        long_message_to_split = true,
        command_palette = true,
      },
    }
  end,
}
