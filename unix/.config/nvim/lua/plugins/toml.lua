-- TOML
-- see: https://toml.io/en/

return {
  -- Add treesitter support for TOML
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "toml" })
      end
    end,
  },

  -- Add TOML LSP support using taplo
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        taplo = {
          keys = {
            {
              "K",
              function()
                vim.lsp.buf.hover()
              end,
              desc = "Hover",
              mode = "n",
            },
            {
              "gd",
              function()
                vim.lsp.buf.definition()
              end,
              desc = "Goto Definition",
              mode = "n",
            },
            {
              "gr",
              function()
                vim.lsp.buf.references()
              end,
              desc = "References",
              mode = "n",
            },
          },
          settings = {
            -- Taplo specific settings
            taplo = {
              diagnostics = {
                enable = true,
              },
              formatter = {
                enable = true,
                rewriteArrays = true,
              },
            },
          },
        },
      },
    },
  },

  -- Install taplo LSP
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "taplo" })
    end,
  },

  -- Add filetype detection for TOML files
  {
    "LazyVim/LazyVim",
    opts = {
      autocmds = {
        {
          "FileType",
          {
            pattern = { "*.toml" },
            callback = function()
              vim.opt_local.filetype = "toml"
            end,
          },
        },
      },
    },
  },
}
