local M = {}

function M.setup()
	local treesitter = require("nvim-treesitter.configs")

	treesitter.setup({
		sync_install = false,
		highlight = {
			enable = true,
		},
	})
end

return M
