local M = {}

--- @class LangConfig
--- @field name string The name of the language.
--- @field patterns string[] The patterns associated with the language.
--- @field lsp LspConfig The LSP configuration.
--- @field linter LinterConfig? The Linter configuration.
--- @field formatter FormatterConfig? The formatter configuration.
--- @field auto_format boolean? Whether to format the file on save.

--- @alias Tool string

--- @class LspConfig
--- @field tool Tool

--- @class LinterConfig
--- @field tool Tool

--- @class FormatterConfig
--- @field tool Tool
--- @field source any

--- @type LangConfig[]
M.langs = {}

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

--- Gets all applied languages.
---
--- @return LangConfig[]
M.get_applied_langs = function()
  ---@type LangConfig[]
  local applied_langs = {}

  for _, lang in ipairs(M.langs) do
    if M.applied_langs:contains(lang.name) then
      table.insert(applied_langs, lang)
    end
  end

  return applied_langs
end

--- Collects all tools from the given language configuration list.
---
--- @param langs LangConfig[]
--- @return Tool[]
M.collect_tools = function(langs)
  local tools = {}

  for _, lang in ipairs(langs) do
    table.insert(tools, lang.lsp.tool)

    if lang.linter ~= nil then
      table.insert(tools, lang.linter.tool)
    end

    if lang.formatter ~= nil then
      table.insert(tools, lang.formatter.tool)
    end
  end

  return tools
end

--- Sets up mason-tool-install
---
--- @param langs LangConfig[]
M.setup_mason_tool_install = function(langs)
  require('mason-tool-installer').setup {
    ensure_installed = M.collect_tools(langs),
    auto_update = true,
    run_on_start = true,
    debounce_hours = 24,
  }
end

--- Sets up auto save.
---
--- @param langs LangConfig[]
M.setup_auto_save = function(langs)
  for _, lang_config in ipairs(langs) do
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
--- @param langs LangConfig[]
M.setup_formatters = function(langs)
  local sources = {}
  for _, lang_config in ipairs(langs) do
    table.insert(sources, lang_config.formatter.source)
  end

  require('null-ls').setup {
    sources = sources,
  }
end

--- Set up the applied languages.
M.setup_langs = function()
  local applied_langs = M.get_applied_langs()
  M.setup_auto_save(applied_langs)
  M.setup_formatters(applied_langs)

  local lang_names = {}
  for _, lang in ipairs(applied_langs) do
    table.insert(lang_names, '"' .. lang.name .. '"')
  end

  vim.schedule(function()
    vim.notify(
      'Applied languages: ' .. table.concat(lang_names, ', '),
      vim.log.levels.INFO
    )
  end)
end

_G.polyglot = M

return M
