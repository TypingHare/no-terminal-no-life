return {
  {
    "lervag/vimtex",
    lazy = false, -- Load immediately
    config = function()
      -- Use system default (Safari) for PDF viewing
      vim.g.vimtex_view_method = "general"
      vim.g.vimtext_view_general_viewer = "open"
      vim.g.vimtext_view_general_options = "-a Safari"

      -- Disable default compilation
      vim.g.vimtex_compiler_enabled = 0

      -- Set up autocommand for running 'just preview' on save
      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = "*.tex",
        callback = function()
          vim.fn.system("just preview")
        end,
        group = vim.api.nvim_create_augroup("TeXPreview", { clear = true }),
      })

      -- Enable syntax highlighting
      vim.g.vimtex_syntax_enabled = 1
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "latex", "bibtex" })
      end
    end,
  },
}
