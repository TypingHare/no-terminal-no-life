-- lua/config/hub.lua

---@alias Theme "auto"|"dark"|"light"
---@alias Border "none"|"single"|"rounded"

---@class ConfigHubUI
---@field theme Theme
---@field border Border
---@field number boolean
---@field relativenumber boolean

---@class ConfigHubLSP
---@field format_on_save boolean
---@field diagnostics_virtual_text boolean

---@class ConfigHub
---@field ui ConfigHubUI
---@field lsp ConfigHubLSP

---@type ConfigHub
local defaults = {}
