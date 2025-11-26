require 'config.keymap.tool'
require 'config.keymap.appearance'
require 'config.keymap.editor'

local lang_dir = vim.fn.stdpath 'config' .. '/lua/config/lang'

for _, file in ipairs(vim.fn.readdir(lang_dir)) do
  if file:match '%.lua$' then
    local module = 'config.lang.' .. file:gsub('%.lua$', '')
    require(module)
  end
end
