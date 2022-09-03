local M = {}

function M.setup()
	require("nvim-tree").setup({
		view = {
			width = 35,
		},
	})
end

return M
