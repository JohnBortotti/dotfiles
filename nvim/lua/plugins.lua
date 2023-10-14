return {
	-- Colorschemes
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[
		    set number
		    set t_Co=256
		    set encoding=UTF-8
		    ]])
			vim.cmd([[
		    let netrw_liststyle=3
		    ]])
			vim.cmd([[
		    set scl=no
		    ]])
			vim.cmd([[ set fillchars=eob:\ ]])
			vim.cmd([[ colorscheme kanagawa-dragon ]])
		end,
	},

	-- Comments
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	-- Lualine
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "powerline",
					component_separators = {
						left = "",
						right = "",
					},
					section_separators = {
						left = "",
						right = "",
					},
				},
			})
		end,
	},
	-- Autopairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({
				enable_check_bracket_line = false,
			})
		end,
	},
	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{ "<S-T>", ":Telescope<CR>" },
		},
		config = function()
			require("telescope").setup({})
		end,
	},
	-- end Telescope
	-- LSP
	-- LSPconfig layer for nvim-lsp
	{ "neovim/nvim-lspconfig" },
	-- Completion engine
	{ "hrsh7th/nvim-cmp" },
	-- Completion with lsp capabilities
	{ "hrsh7th/cmp-nvim-lsp" },
	-- Completion with buffer data
	{ "hrsh7th/cmp-buffer" },
	-- Completion with filesystem paths
	{ "hrsh7th/cmp-path" },
	-- Sinppets
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },
	-- Snippets collection
	{ "rafamadriz/friendly-snippets" },
	-- Function Signatures
	{ "ray-x/lsp_signature.nvim" },
	-- LSP server installer
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	--- end LSP
	-- Tree sitter
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			local treesitter = require("nvim-treesitter.configs")

			treesitter.setup({
				-- ensure_installed = { "c", "lua", "rust", "javascript", "php" },
				sync_install = false,
				highlight = {
					enable = true,
				},
			})
		end,
	},
}
