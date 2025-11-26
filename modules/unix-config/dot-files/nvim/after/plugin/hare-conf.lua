-- Collect all languages configuration
---@type HareConfEditorLang[]
local lang_configs = {}
local hare_conf = require 'hare-conf'
for lang_name, _ in pairs(hare_conf.config.editor.lang) do
  local lang_config = hare_conf.fn.editor.get_lang_config(lang_name)
  table.insert(lang_configs, lang_config)
end

-- Automatically install treesitters
local treesitter_names = {}
for _, lang_config in pairs(lang_configs) do
  if lang_config.treesitter and lang_config.treesitter.name ~= '' then
    table.insert(treesitter_names, lang_config.treesitter.name)
  end
end

local treesitter = require 'nvim-treesitter.configs'
---@diagnostic disable-next-line: missing-fields
treesitter.setup {
  ensure_installed = treesitter_names,
  auto_install = true,
}

-- Automatically install LSPs, Debuggers, Linters, and Formatters
local add_tool_name = function(name_list, tool_entry)
  if tool_entry and tool_entry.enabled and tool_entry.name ~= '' then
    table.insert(name_list, tool_entry.name)
  end
end
local tool_names = {}
for _, lang_config in pairs(lang_configs) do
  add_tool_name(tool_names, lang_config.lsp)
  add_tool_name(tool_names, lang_config.linter)
  add_tool_name(tool_names, lang_config.formatter)
end

require('mason-tool-installer').setup {
  ensure_installed = tool_names,
}
vim.cmd 'MasonToolsUpdate'
