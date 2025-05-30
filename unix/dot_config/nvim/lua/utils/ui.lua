-- This module stores

local M = {}

M.get_neo_tree_size = function()
  local constants = require 'constants.ui'
  return math.max(
    constants.NEO_TREE_MIN_WIDTH,
    math.floor(vim.o.columns * constants.NEO_TREE_WIDTH_MULTIPLIER)
  )
end

_G.ui = M

return M
