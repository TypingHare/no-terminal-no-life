-- Find files
km.n {
  key = '<leader>ff',
  action = ':Telescope find_files<CR>',
  desc = '(f)ind files',
}

-- Find old files
km.n {
  key = '<leader>fo',
  action = function()
    require('telescope.builtin').oldfiles { cwd_only = true }
  end,
  desc = 'find (o)ld files',
}

-- Live grep
km.n {
  key = '<leader>fg',
  action = ':Telescope live_grep<CR>',
  desc = 'live (g)rep',
}

-- Find buffers
km.n {
  key = '<leader>fb',
  action = ':Telescope buffers<CR>',
  desc = 'find buffers',
}

-- Find help
km.n {
  key = '<leader>fh',
  action = ':Telescope help_tags<CR>',
  desc = '(h)elp tags',
}

local telescope = require 'telescope.builtin'
local function search_files_with_same_extension()
  local ext = vim.fn.expand '%:e'
  if ext == '' then
    vim.notify(
      'No file extension found for current buffer.',
      vim.log.levels.ERROR
    )
    return
  end
  telescope.find_files {
    find_command = { 'fd', '--type', 'f', '--extension', ext },
    prompt_title = 'Files with extension: ' .. ext,
  }
end

km.n {
  key = '<leader>ft',
  action = search_files_with_same_extension,
  desc = 'Files with Same Extension',
}
