-- Open terminal
km.n {
  key = '<leader>tt',
  action = ':terminal<CR>',
  desc = 'Open Terminal',
}

-- In terminal, `<Esc>` can
km.t {
  key = '<Esc>',
  action = [[<C-\><C-n>]],
}

local Terminal = require('toggleterm.terminal').Terminal

-- Function to get the project root
local function get_project_root()
  local root = vim.fn.finddir('.git/..', '.;')
  if root == '' then
    root = vim.fn.getcwd()
  end
  return root
end

-- Function to create and open terminal with venv
local function open_float_terminal_with_venv()
  local root = get_project_root()
  local activate_path = root .. '/.venv/bin/activate'

  local term = Terminal:new {
    direction = 'float',
    cwd = root,
    hidden = true,
    start_in_insert = true,
    close_on_exit = true,
  }

  term:spawn()

  -- Send setup commands
  if vim.fn.filereadable(activate_path) == 1 then
    term:send('source ' .. activate_path, true)
  end

  -- Clear the terminal screen
  term:send('clear', true)

  -- Finally open the floating window
  term:toggle()
  vim.defer_fn(function()
    vim.cmd 'startinsert!'
  end, 50)
end

-- Open toggle terminal (direction = float)
km.n {
  key = '<leader>tf',
  action = open_float_terminal_with_venv,
  desc = 'Toggle Terminal (float)',
}
