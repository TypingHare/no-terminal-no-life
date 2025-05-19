return {
  'nvim-neo-tree/neo-tree.nvim',
  opts = {
    window = {
      mappings = {
        ['<cr>'] = function(state)
          local node = state.tree:get_node()
          if node and node.type == 'file' then
            require('neo-tree.sources.filesystem.commands').open(state)
            vim.cmd('Neotree close')
          else
            require('neo-tree.sources.filesystem.commands').toggle_node(state)
          end
        end,
        ['n'] = 'add',
      },
    },
  },
}
