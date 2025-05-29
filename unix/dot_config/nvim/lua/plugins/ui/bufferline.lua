local keymaps = {
  -- Static keymaps
  {
    '<Tab>',
    '<Cmd>BufferLineCycleNext<CR>',
    desc = 'Next buffer',
    silent = true,
  },
  {
    '<S-Tab>',
    '<Cmd>BufferLineCyclePrev<CR>',
    desc = 'Previous buffer',
    silent = true,
  },
  {
    '<Leader>bo',
    '<Cmd>BufferLineCloseOthers<CR>',
    desc = 'Close other buffers',
  },
}

-- Dynamically add <leader>b1 to b9
for i = 1, 9 do
  table.insert(keymaps, {
    '<leader>b' .. i,
    string.format(
      '<Cmd>lua require("bufferline").go_to_buffer(%d, true)<CR>',
      i
    ),
    desc = string.format('Go to buffer #%d', i),
    silent = true,
  })
end

return {
  'akinsho/bufferline.nvim',
  opts = {
    options = {
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'Neo-tree',
          highlight = 'Directory',
          text_align = 'left',
          separator = false,
        },
      },
      show_buffer_close_icons = false,
      show_close_icon = false,
      diagnostics = 'nvim_lsp',
      always_show_bufferline = true,
    },
    highlights = {
      buffer_selected = {
        fg = '#e9ecef',
        bold = true,
        italic = false,
      },
    },
  },
  keys = keymaps,
}
