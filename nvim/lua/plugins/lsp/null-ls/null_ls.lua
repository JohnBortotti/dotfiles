local M = {}

local nls = require("null-ls")
local b = nls.builtins

local with_diagnostics_code = function(builtin)
	return builtin.with({
		diagnostics_format = "#{m} [#{c}]",
	})
end

local with_root_file = function(builtin, file)
	return builtin.with({
		condition = function(utils)
			print(utils.root_has_file(file))
			return utils.root_has_file(file)
		end,
	})
end

local sources = {
	-- formatting
	b.formatting.prettier,
	-- b.formatting.shfmt,
	b.formatting.stylua,
	b.formatting.fixjson,
	b.formatting.black.with({ extra_args = { "--fast" } }),
	b.formatting.isort,
	with_root_file(b.formatting.stylua, "stylua.toml"),

	-- diagnostics
	b.diagnostics.write_good,
	b.diagnostics.markdownlint,
	b.diagnostics.eslint_d,
	b.diagnostics.flake8,
	b.diagnostics.tsc,

	-- code actions
	b.code_actions.gitsigns,
	b.code_actions.gitrebase,

	-- hover
	b.hover.dictionary,
}

function M.setup(opts)
	nls.setup({
		debug = true,
		debounce = 150,
		save_after_format = false,
		sources = sources,
		on_attach = opts.on_attach,
	})
end

return M
