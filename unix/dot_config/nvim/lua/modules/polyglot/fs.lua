local M = {}

--- Gets the Polyglot language list from a JSON file.
---
--- This function reads the language list from 'polyglot/lang.json' under the
--- Neovim configuration directory. The JSON file should contain an array of
--- strings, each representing a language name supported by Polyglot.
---
--- @return string[]
M.get_langs_from_config = function()
  local config_filepath = vim.fn.stdpath 'config' .. '/polyglot/langs.json'
  local file = io.open(config_filepath, 'r')
  if not file then
    return {}
  end

  local content = file:read '*a'
  file:close()

  local ok, langs = pcall(vim.json.decode, content)
  if not ok then
    vim.notify(
      'Fail to parse Polyglot language list file.',
      vim.log.levels.ERROR
    )
    return {}
  end

  return langs
end

return M
