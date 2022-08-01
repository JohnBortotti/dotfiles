local M = {}

function M.setup()
	require("neorg").setup({
		load = {
			["core.defaults"] = {},
			["core.norg.dirman"] = {
				config = {
					workspaces = {
						home = "/var/www/notes/home",
					},
				},
			},
			["core.norg.concealer"] = {},
		},
	})
end

return M
