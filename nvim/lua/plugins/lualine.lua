local M = {}


function M.setup()
	local gps = require("nvim-gps")

	require("lualine").setup({
		options = {
			theme = "powerline",
			component_separators = { left = '', right = ''},
			section_separators = { left = '', right = ''},
		},
	})
end

return M
