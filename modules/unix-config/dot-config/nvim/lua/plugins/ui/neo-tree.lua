return {
	'nvim-neo-tree/neo-tree.nvim',
	dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      -- optional, for icons:
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    opts = {
      filesystem = {
        hijack_netrw_behavior = "open_default",
      },
    },
}
