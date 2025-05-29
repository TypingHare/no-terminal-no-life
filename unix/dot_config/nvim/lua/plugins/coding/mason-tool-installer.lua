return {
  'WhoIsSethDaniel/mason-tool-installer.nvim',
  dependencies = { 'williamboman/mason.nvim' },
  config = function()
    require('mason-tool-installer').setup {
      ensure_installed = {
        'stylua',
        'luacheck',
      },
      run_on_start = true,
    }
  end,
}
