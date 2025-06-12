local M = {}

--- @class Polyglot.LangConfig
--- @field name string The name (ID) of the language.
--- @field filetypes string[]
--- @field treesitter Polyglot.Treesitter The treesitter configuration.
--- @field lsp Polyglot.LspConfig The LSP configuration.
--- @field linter Polyglot.LinterConfig? The Linter configuration.
--- @field formatter Polyglot.FormatterConfig? The formatter configuration.
--- @field format_on_save boolean? Whether to format the file on save.

--- @alias Polyglot.Tool string

--- @class Polyglot.Treesitter
--- @field tool Polyglot.Tool

--- @class Polyglot.LspConfig
--- @field tool Polyglot.Tool
--- @field setup? table

--- @class Polyglot.LinterConfig
--- @field tool Polyglot.Tool

--- @class Polyglot.FormatterConfig
--- @field tool Polyglot.Tool

--- @type Polyglot.LangConfig[]
M.langs = {}

--- Adds a language.
---
--- This function will add a language configuration to polyglot, but it is not
--- automatically applied. You have to use the `apply` method to apply the
--- language, so that it is setup when you call the `setup_langs` method.
---
--- @param lang_config Polyglot.LangConfig
M.add_lang = function(lang_config)
  table.insert(M.langs, lang_config)
end

--- The languages to be applied.
M.applied_langs = require 'plenary.collections.py_list' {}

--- Applies the languages specified in the Polyglot language list.
M.auto_apply = function()
  M.apply(require('polyglot.fs').get_langs_from_config())
end

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
--- @return Polyglot.LangConfig[]
M.get_applied_langs = function()
  ---@type Polyglot.LangConfig[]
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
--- @param langs Polyglot.LangConfig[]
--- @return Polyglot.Tool[]
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

--- Sets up mason-tool-install.
---
--- @param langs Polyglot.LangConfig[]
M.setup_mason_tool_install = function(langs)
  require('mason-tool-installer').setup {
    ensure_installed = M.collect_tools(langs),
    auto_update = true,
    run_on_start = false,
  }

  -- Install all the tools
  vim.cmd 'MasonToolsUpdate'
end

--- Function to get lspconfig name from mason package name
--- @return string|nil
local function get_lsp_name(package_name)
  local package_to_lspconfig =
    require('mason-lspconfig').get_mappings()['package_to_lspconfig']
  return package_to_lspconfig[package_name] or nil
end

--- Sets up treesitter.
---
--- @param langs Polyglot.LangConfig[]
M.setup_treesitter = function(langs)
  local tools = {}
  for _, lang in ipairs(langs) do
    if lang.treesitter then
      table.insert(tools, lang.treesitter.tool)
    end
  end

  local treesitter = require 'nvim-treesitter.configs'
  ---@diagnostic disable-next-line: missing-fields
  treesitter.setup {
    ensure_installed = tools,
    highlight = { enable = true },
    auto_install = true,
  }
end

--- Sets up LSP.
---
--- @param langs Polyglot.LangConfig[]
M.setup_lsp = function(langs)
  local lspconfig = require 'lspconfig'
  for _, lang in ipairs(langs) do
    local lsp_name = get_lsp_name(lang.lsp.tool)
    if lsp_name ~= nil then
      lspconfig[lsp_name].setup(lang.lsp.setup or {})
    else
      vim.notify(
        'LSP for ' .. lang.name .. ' not found: ' .. lang.lsp.tool,
        vim.log.levels.WARN
      )
    end
  end
end

--- Sets up conform.
---
--- @param langs Polyglot.LangConfig[]
M.setup_conform = function(langs)
  local formatters_by_ft = {}
  for _, lang in ipairs(langs) do
    local filetypes = lang.filetypes
    if filetypes and lang.formatter and lang.formatter.tool then
      for _, filetype in ipairs(filetypes) do
        formatters_by_ft[filetype] = { lang.formatter.tool }
      end
    end
  end

  require('conform').formatters_by_ft = formatters_by_ft
end

--- Sets up auto save.
M.setup_auto_save = function()
  vim.api.nvim_create_autocmd('BufWritePre', {
    callback = function()
      if vim.bo.modified then
        require('conform').format()
      end
    end,
  })
end

--- Sets up the applied languages.
M.setup_langs = function()
  local applied_langs = M.get_applied_langs()
  M.setup_treesitter(applied_langs)
  M.setup_mason_tool_install(applied_langs)
  M.setup_lsp(applied_langs)
  M.setup_conform(applied_langs)
  M.setup_auto_save()

  local lang_names = {}
  for _, lang in ipairs(applied_langs) do
    table.insert(lang_names, '"' .. lang.name .. '"')
  end
end

require 'polyglot.fs'

return M
