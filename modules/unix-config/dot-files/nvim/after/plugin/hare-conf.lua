-- Bash
require('hare-conf').fn.editor.set_lang_config({ 'sh', 'zsh' }, {
  treesitter = { name = 'bash' },
  lsp = { name = 'bashls' },
  linter = { name = 'shellcheck' },
  formatter = { name = 'shfmt' },
})

-- Cmake
require('hare-conf').fn.editor.set_lang_config({ 'cmake' }, {
  treesitter = { name = 'cmake' },
  lsp = { name = 'cmake' },
  linter = { name = 'cmakelint' },
})

-- C++
require('hare-conf').fn.editor.set_lang_config({ 'cpp' }, {
  treesitter = { name = 'cpp' },
  lsp = { name = 'clangd' },
  formatter = { name = 'clang-format' },
  tab = { width = 4 },
})

-- CSS
require('hare-conf').fn.editor.set_lang_config({ 'css' }, {
  treesitter = { name = 'css' },
  lsp = { name = 'cssls' },
  formatter = { name = 'prettier' },
  tab = { width = 4 },
})

-- HTML
require('hare-conf').fn.editor.set_lang_config({ 'html' }, {
  treesitter = { name = 'html' },
  lsp = { name = 'html' },
  formatter = { name = 'prettier' },
})

-- Java
require('hare-conf').fn.editor.set_lang_config({ 'java' }, {
  treesitter = { name = 'java' },
  lsp = { name = 'jdtls' },
  formatter = { name = 'google-java-format' },
  tab = { width = 4 },
})

-- JSON
require('hare-conf').fn.editor.set_lang_config({ 'json' }, {
  treesitter = { name = 'json' },
  lsp = { name = 'jsonls' },
  formatter = { name = 'prettier' },
  color_column = { enabled = false },
})

-- Just
require('hare-conf').fn.editor.set_lang_config({ 'just' }, {
  treesitter = { name = 'just' },
  lsp = { name = 'just' },
  formatter = { name = 'prettier' },
  tab = { width = 4 },
})

-- LaTeX
require('hare-conf').fn.editor.set_lang_config({ 'tex' }, {
  treesitter = { name = 'latex' },
  lsp = { name = 'texlab' },
  linter = { enabled = false },
  formatter = { name = 'latexindent' },
  tab = { width = 4 },
  color_column = { enabled = false },
})

-- Lua
require('hare-conf').fn.editor.set_lang_config({ 'lua' }, {
  treesitter = { name = 'lua' },
  lsp = { name = 'lua_ls' },
  formatter = { name = 'stylua' },
  color_column = { enabled = false },
})

-- Make
require('hare-conf').fn.editor.set_lang_config({ 'make', 'makefile' }, {
  treesitter = { name = 'make' },
  lsp = { name = 'mbake' },
  linter = { name = 'checkmake' },
  formatter = { name = 'mbake' },
  tab = { expand_with_spaces = false },
})

-- Markdown
require('hare-conf').fn.editor.set_lang_config({ 'markdown' }, {
  treesitter = { name = 'markdown' },
  lsp = { name = 'marksman' },
  linter = { name = 'markdownlint' },
  formatter = { name = 'prettier' },
  color_column = { enabled = false },
})

-- Python
require('hare-conf').fn.editor.set_lang_config({ 'json' }, {
  treesitter = { name = 'python' },
  lsp = { name = 'pyright' },
  formatter = { enabled = false },
  color_column = { width = 88 },
  tab = { width = 4 },
})

-- Rust
require('hare-conf').fn.editor.set_lang_config({ 'rust' }, {
  treesitter = { name = 'rust' },
  lsp = { name = 'rust-analyzer' },
  linter = { name = 'bacon' },
  formatter = { name = 'rustfmt' },
  tab = { width = 4 },
})

-- SQL
require('hare-conf').fn.editor.set_lang_config({ 'sql' }, {
  treesitter = { name = 'sql' },
  lsp = { name = 'sqls' },
  formatter = { name = 'sqruff' },
})

-- Svelte
require('hare-conf').fn.editor.set_lang_config({ 'svelte' }, {
  treesitter = { name = 'svelte' },
  lsp = { name = 'svelte' },
  formatter = { name = 'prettier' },
})

-- systemd
require('hare-conf').fn.editor.set_lang_config({ 'systemd' }, {
  lsp = { name = 'systemd_ls' },
  linter = { name = 'systemdlint' },
  tab = { width = 8 },
})

-- TOML
require('hare-conf').fn.editor.set_lang_config({ 'toml' }, {
  treesitter = { name = 'toml' },
  lsp = { name = 'taplo' },
  formatter = { name = 'taplo' },
})

-- JavaScript/TypeScript/JSX/TSX
require('hare-conf').fn.editor.set_lang_config({
  'javascript',
  'typescript',
  'javascriptreact',
  'typescriptreact',
}, {
  lsp = { name = 'ts_ls' },
  linter = { name = 'eslint-lsp' },
  formatter = { name = 'prettier' },
})

-- Typos (Spell checker)
require('hare-conf').fn.editor.set_lang_config({ '*' }, {
  lsp = { name = 'typos_lsp' },
})

-- YAML
require('hare-conf').fn.editor.set_lang_config({ 'yaml', 'yml' }, {
  treesitter = { name = 'yaml' },
  lsp = { name = 'yamlls' },
  linter = { name = 'yamllint' },
  formatter = { name = 'prettier' },
})

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
  if lang_config.treesitter then
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
  if tool_entry and tool_entry.enabled then
    local tool_name = tool_entry.name
    if not vim.tbl_contains(name_list, tool_name) then
      table.insert(name_list, tool_entry.name)
    end
  end
end
local tool_names = {}
for _, lang_config in pairs(lang_configs) do
  add_tool_name(tool_names, lang_config.lsp)
  add_tool_name(tool_names, lang_config.linter)
  add_tool_name(tool_names, lang_config.formatter)
end

local mappings =
  require('mason-lspconfig.mappings').get_mason_map().lspconfig_to_package
local function resolve_mason_name(name)
  return mappings[name] or name
end

for _, tool_name in ipairs(tool_names) do
  local ok, pkg = pcall(require('mason-registry').get_package, tool_name)
  if not ok then
    local mason_name = resolve_mason_name(tool_name)
    local ok2, pkg2 = pcall(require('mason-registry').get_package, mason_name)
    if not ok2 then
      vim.notify('Mason: package not found: ' .. tool_name, vim.log.levels.WARN)
    else
      if not pkg2:is_installed() then
        vim.notify('Mason: Installing: ' .. tool_name .. '(' .. mason_name .. 
        ')')
        pkg2:install()
      end
    end
  else
    if not pkg:is_installed() then
      vim.notify('Mason: Installing: ' .. tool_name)
      pkg:install()
    end
  end
end
