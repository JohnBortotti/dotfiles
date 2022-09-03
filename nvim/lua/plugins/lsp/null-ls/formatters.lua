local M = {}

local utils = require("plugins/utils")
local nls_sources = require("null-ls.sources")

local method = require("null-ls").methods.FORMATTING

M.autoformat = true
function M.toggle()
  M.autoformat = not M.autoformat
  if M.autoformat then
    utils.info("Enabled format on save", "Formatting")
  else
    utils.warn("Disabled format on save", "Formatting")
  end
end

function M.format()
  if M.autoformat then
    vim.lsp.buf.format()
  end
end

function M.has_formatter(filetype)
  local available = nls_sources.get_available(filetype, method)
  return #available > 0
end

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
  local supported_formatters = nls_sources.get_supported(filetype, "formatting")
  table.sort(supported_formatters)
  return supported_formatters
end

function M.setup(client, buf)
  local filetype = vim.api.nvim_buf_get_option(buf, "filetype")

  local enable = false

  if M.has_formatter(filetype) then
    enable = client.name == "null-ls"
  else
    enable = not (client.name == "null-ls")
  end

  client.resolved_capabilities.document_formatting = enable --enable
  client.resolved_capabilities.document_range_formatting = enable --enable
  if client.resolved_capabilities.document_formatting then
    vim.cmd([[
    augroup LspFormat
    autocmd! * <buffer>
    autocmd BufWritePre <buffer> lua require("plugins/lsp/null-ls/formatters").format()
    augroup END
   ]])
  end
end

return M
