local M = {}

function M.setup()
	local treesitter = require("nvim-treesitter.configs")

	treesitter.setup({
		-- ensure_installed = { "c", "lua", "rust", "javascript", "php" },
		sync_install = false,
		highlight = {
			enable = true,
		},
	})
end

return M
