return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = function()
    return {
      format = {
        formatting_options = nil,
        timeout_ms = nil,
      },
    }
  end,
  config = function() end,
}
