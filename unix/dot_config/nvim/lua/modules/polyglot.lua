local M = {}

---@class LangConfig
---@field name string The name of the language.
---@field patterns string[] The patterns associated with the language.
---@field lsp LspConfig The LSP configuration.
---@field linter LinterConfig? The Linter configuration.
---@field formatter FormatterConfig? The formatter configuration.
---@field auto_format boolean? Whether to format the file on save.

---@class LspConfig
---@field name string

---@class LinterConfig
---@field name string

---@class FormatterConfig
---@field source any

---@type LangConfig[]
M.langs = {
  {
    name = 'lua',
    patterns = { '*.lua' },
    lsp = { name = 'lua_language_server' },
    formatter = { source = require('null-ls').builtins.formatting.stylua },
    auto_format = true,
  },
}

--- Adds a language.
---
--- This function will add a language configuration to polyglot, but it is not
--- automatically applied. You have to use the `apply` method to apply the
--- language, so that it is setup when you call the `setup_langs` method.
---
--- @param lang_config LangConfig
M.add_lang = function(lang_config)
  table.insert(M.langs, lang_config)
end

--- The languages to be applied.
M.applied_langs = require 'plenary.collections.py_list' {}

--- Applies some languages.
---
--- @param names string[] The names of languages to apply
M.apply = function(names)
  for _, name in ipairs(names) do
    M.applied_langs:push(name)
  end
end

--- Sets up auto save.
---
---@param lang_configs LangConfig[]
M.set_format_on_save = function(lang_configs)
  for _, lang_config in ipairs(lang_configs) do
    if not lang_config.auto_format then
      return
    end

    vim.api.nvim_create_autocmd('BufWritePre', {
      pattern = lang_config.patterns,
      callback = function()
        vim.lsp.buf.format { async = false }
      end,
    })
  end
end

--- Sets up formatter.
---
--- @param lang_configs LangConfig[]
M.setup_formatters = function(lang_configs)
  local sources = {}
  for _, lang_config in ipairs(lang_configs) do
    table.insert(sources, lang_config.formatter.source)
  end

  require('null-ls').setup {
    sources = sources,
  }
end

--- Set up the applied languages.
M.setup_langs = function()
  ---@type LangConfig[]
  local applied_lang_configs = {}

  for _, lang_config in ipairs(M.langs) do
    if M.applied_langs:contains(lang_config.name) then
      table.insert(applied_lang_configs, lang_config)
    end
  end

  local lang_names = {}
  for _, lang in ipairs(applied_lang_configs) do
    table.insert(lang_names, '"' .. lang.name .. '"')
  end

  vim.notify(
    'Applied languages: ' .. table.concat(lang_names, ', '),
    vim.log.levels.INFO
  )

  M.setup_formatters(applied_lang_configs)
end

_G.polyglot = M

return M
