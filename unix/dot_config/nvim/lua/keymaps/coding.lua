-- Create a newline down below
km.i {
  key = '<S-Enter>',
  action = '<ESC>o',
}

-- Create a newline down below
km.n {
  key = '<S-Enter>',
  action = 'o<ESC>',
}

-- Rename the idenifier where the cursor is
km.n {
  key = '<leader>cr',
  action = km.lua 'vim.lsp.buf.rename()',
  desc = 'Rename Identifier',
}

-- Format file
km.n {
  key = '<leader>cf',
  action = km.lua 'vim.lsp.buf.format()',
  desc = 'Format File',
}

-- Show diagnostics under the cursor
km.n {
  key = '<leader>cd',
  action = vim.diagnostic.open_float,
  desc = 'Show Diagnostics',
}

-- Go to definition under the cursor
km.n {
  key = 'gd',
  action = require('telescope.builtin').lsp_definitions,
  desc = 'Go to definition',
}

km.n {
  key = 'grr',
  action = require('telescope.builtin').lsp_references,
  desc = 'Go to references',
}

km.n {
  key = 'gri',
  action = require('telescope.builtin').lsp_references,
  desc = 'Go to Implementations',
}

-- Enable copilot.
km.n {
  key = '<leader>cce',
  action = ':Copilot enable<CR>',
  desc = 'Enable Copilot',
}

-- Disable copilot.
km.n {
  key = '<leader>ccd',
  action = ':Copilot disable<CR>',
  desc = 'Disable Copilot',
}

vim.keymap.set('n', '<leader>st', '<cmd>lua require("spectre").toggle()<CR>', {
  desc = 'Toggle Spectre',
})
vim.keymap.set(
  'n',
  '<leader>sw',
  '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
  {
    desc = 'Search current word',
  }
)
vim.keymap.set(
  'v',
  '<leader>sw',
  '<esc><cmd>lua require("spectre").open_visual()<CR>',
  {
    desc = 'Search current word',
  }
)
vim.keymap.set(
  'n',
  '<leader>sp',
  '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
  {
    desc = 'Search on current file',
  }
)
