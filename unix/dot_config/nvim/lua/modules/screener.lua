--- Module for managing FileType autocmd groups in Neovim
local M = {}

--- Predefined filetype groups
---@type table<string, string[] | string>
M.groups = {
  ALL = '*',
  UNEDITABLE_FILETYPES = {
    'lazy',
    'dashboard',
    'neo-tree',
    'notify',
    'help',
  },
  BACKGROUND_HIGHLIGHT_GROUPS = {
    'Normal',
    'NormalNC',
    'NormalFloat',
    'EndOfBuffer',
    'FloatBorder',
    'SignColumn',
  },
}

--- Gets the elements associated with a specific group name.
---@param group string | nil
---@param default string | nil
---@return string[] | string
M.get_elements_by_group = function(group, default)
  local group_name = group or default
  local elements = M.groups[group_name]
  if not elements then
    vim.notify(
      ('Unknown group name: %s'):format(group_name),
      vim.log.levels.ERROR
    )
    return {}
  end

  return elements
end

--- Registers an autocmd for a specific screening group.
---@param opts { group: string, event: string, callback: fun(): nil }
M.listen = function(opts)
  local filetypes = M.get_elements_by_group(opts.group)
  vim.api.nvim_create_autocmd(opts.event, {
    pattern = filetypes,
    callback = opts.callback,
  })
end

--- Changes the highlight group for a specific screening group.
---@param opts { group: string, highlight: any }
M.set_highlight_group = function(opts)
  local elements = M.get_elements_by_group(opts.group)
  for _, element in ipairs(elements) do
    vim.api.nvim_set_hl(0, element, opts.highlight)
  end
end

return M
