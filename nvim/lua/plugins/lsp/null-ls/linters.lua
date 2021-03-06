local M = {}

local nls_sources = require("null-ls.sources")

local method = require("null-ls").methods.DIAGNOSTICS

function M.list_registered_providers_names(filetype)
  local s = require("null-ls.sources")
  local available_sources = s.get_available(filetype)
  local registered = {}
  for _, source in ipairs(available_sources) do
    for method in pairs(source.methods) do
      registered[method] = registered[method] or {}
      table.insert(registered[method], source.name)
    end
  end
  return registered
end

function M.list_registered(filetype)
  local registered_providers = M.list_registered_providers_names(filetype)
  return registered_providers[method] or {}
end

function M.list_supported(filetype)
  local supported_linters = nls_sources.get_supported(filetype, "diagnostics")
  table.sort(supported_linters)
  return supported_linters
end

return M
