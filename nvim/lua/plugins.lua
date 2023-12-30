return {
	-- colorschemes
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- nvim configs
			vim.cmd([[
		    set number
		    set t_Co=256
		    set encoding=UTF-8
		    ]])
			-- netrw
			vim.cmd([[
		    let netrw_liststyle=3
			let netrw_winsize=30
			let g:netrw_banner = 0
		    ]])
			vim.cmd([[
		    set scl=no
		    ]])
			-- colorscheme
			vim.cmd([[ set fillchars=eob:\ ]])
			vim.cmd([[ colorscheme kanagawa-dragon ]])
			-- key mappings
			vim.cmd([[
				nnoremap <leader>e :Lexplore<CR>
				nnoremap <leader>h :noh<CR>
				nnoremap <leader>t :Telescope<CR>
				nnoremap <leader>x :bd<CR>
				nnoremap <leader>w :w<CR>
			]])
			vim.api.nvim_set_keymap('n', '<Leader>bf', '<Cmd>lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })
		end,
	},
	-- comments
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	-- lualine
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
	-- autopairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({
				enable_check_bracket_line = false,
			})
		end,
	},
	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({})
		end,
	},
	-- end Telescope
	-- LSP
	-- LSPconfig layer for nvim-lsp
	{ "neovim/nvim-lspconfig" },
	-- completion engine
	{ "hrsh7th/nvim-cmp" },
	-- completion with lsp capabilities
	{ "hrsh7th/cmp-nvim-lsp" },
	-- completion with buffer data
	{ "hrsh7th/cmp-buffer" },
	-- completion with filesystem paths
	{ "hrsh7th/cmp-path" },
	-- sinppets
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },
	-- snippets collection
	{ "rafamadriz/friendly-snippets" },
	-- function Signatures
	{ "ray-x/lsp_signature.nvim" },
	-- LSP server installer
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	--- end LSP
	-- tree sitter
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
