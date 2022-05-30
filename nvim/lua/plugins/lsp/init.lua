local M = {}

local servers = require("plugins/lsp/servers")

local function on_attach(client, bufnr)
	-- Enable completion triggered by <C-X><C-O>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Use LSP as the handler for formatexpr.
	vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

	-- Configure key mappings
	require("plugins/lsp/keymaps").setup(client, bufnr)

	-- Configure Highlighting
	require("plugins/lsp/highlight")

	-- Configure formatting
	require("plugins/lsp/null-ls/formatters").setup(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local opts = {
	on_attach = on_attach,
	capabilities = capabilities,
	flags = {
		debounce_text_changes = 150,
	},
}

function M.setup()
	-- servers installer
	require("plugins/lsp/installer").setup(servers, opts)

	-- completion
	require("plugins/lsp/cmp")

	-- Null-ls
	require("plugins/lsp/null-ls/null_ls").setup(opts)
end

return M
