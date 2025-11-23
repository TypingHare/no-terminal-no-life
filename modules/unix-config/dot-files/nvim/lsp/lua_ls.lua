return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.git', 'stylua.toml' },
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}
