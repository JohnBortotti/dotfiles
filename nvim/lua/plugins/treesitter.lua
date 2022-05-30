local M = {}

function M.setup()
	local treesitter = require("nvim-treesitter.configs")

	treesitter.setup({
		highlight = {
			enable = true,
		},
	})
end

return M
