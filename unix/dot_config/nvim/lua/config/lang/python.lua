require('polyglot').add_lang {
  name = 'Python',
  filetypes = { 'python' },
  lsp = { tool = 'pyright' },
  linter = { tool = 'ruff' },
  formatter = { tool = 'ruff' },
  format_on_save = true,
}

require('lspconfig').ruff.setup {}

local function run_python_file()
  if vim.bo.filetype ~= 'python' then
    return
  end

  -- Get full path of current file
  local file_path = vim.fn.expand '%:p'

  -- Get the relative path of the file
  local relative_path = vim.fn.fnamemodify(file_path, ':~:.')

  -- Open terminal
  vim.cmd 'terminal'

  -- Determine project root (fallback to current dir)
  local root = vim.fn.finddir('.git/..', '.;')
  if root == '' then
    root = vim.fn.getcwd()
  end
  vim.fn.chansend(vim.b.terminal_job_id, 'cd ' .. root .. '\n')

  -- Source the activate script if it exists
  local activate = root .. '/.venv/bin/activate'
  if vim.fn.filereadable(activate) == 1 then
    vim.fn.chansend(vim.b.terminal_job_id, 'source ' .. activate .. '\n')
  end

  -- Clear the terminal screen
  vim.fn.chansend(vim.b.terminal_job_id, 'clear\n')

  -- Run the Python file
  vim.fn.chansend(vim.b.terminal_job_id, 'python ' .. relative_path .. '\n')
end

km.n {
  key = '<leader>rf',
  action = run_python_file,
  desc = 'Run',
}
