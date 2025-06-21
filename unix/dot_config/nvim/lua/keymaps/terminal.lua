-- Open a terminal buffer
km.n {
  key = '<leader>tt',
  action = ':terminal<CR>',
  desc = 'Open Terminal',
}

-- If the terminal buffer is not lazygit, then <Esc> can bring the user back to
-- the normal mode
km.t {
  key = '<Esc>',
  action = function()
    local ft = vim.bo.filetype
    if ft ~= 'lazygit' then
      vim.cmd 'stopinsert'
    end
  end,
}

local Terminal = require('toggleterm.terminal').Terminal

--- Determines the root directory of the current project.
local function get_project_root()
  local root = vim.fn.finddir('.git/..', '.;')
  if root == '' then
    root = vim.fn.getcwd()
  end
  return root
end

--- Function to create and open terminal with venv
local function open_float_terminal_with_venv()
  local root = get_project_root()
  local env_file_path = root .. '/env.sh'
  local term = Terminal:new {
    direction = 'float',
    cwd = root,
    hidden = true,
    start_in_insert = true,
    close_on_exit = true,
  }

  term:spawn()

  -- Send setup commands
  if vim.fn.filereadable(env_file_path) == 1 then
    term:send('source ' .. env_file_path, true)
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
