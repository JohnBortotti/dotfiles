-- lsp servers
-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations
require("lspconfig").lua_ls.setup({})
require("lspconfig").tsserver.setup({})
require("lspconfig").ocamllsp.setup({})
require("lspconfig").rust_analyzer.setup({})
require("lspconfig").pylsp.setup({})
require("lspconfig").hls.setup({})

-- function signatures
require("lsp_signature").setup()

-- config completion menu
vim.o.completeopt = "menuone,noselect"

-- inject lsp capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- completion and snippets
local cmp = require("cmp")
local luasnip = require("luasnip")

local source_mapping = {
	buffer = "Buffer",
	nvim_lsp = "LSP",
	path = "Path",
	luasnip = "LuaSnip",
}

-- setup cmp config
cmp.setup({
	sources = {
		{
			name = "nvim_lsp",
		},
		{
			name = "luasnip",
		},
		{
			name = "buffer",
		},
		{
			name = "path",
		},
	},

	formatting = {
		format = function(entry, vim_item)
			local menu = source_mapping[entry.source.name]
			vim_item.menu = menu
			return vim_item
		end,
	},

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	
	mapping = {
		["<C-n>"] = cmp.mapping.select_next_item({
			behavior = cmp.SelectBehavior.Insert,
		}),
		["<C-p>"] = cmp.mapping.select_prev_item({
			behavior = cmp.SelectBehavior.Insert,
		}),
		["<Down>"] = cmp.mapping.select_next_item({
			behavior = cmp.SelectBehavior.Select,
		}),
		["<Up>"] = cmp.mapping.select_prev_item({
			behavior = cmp.SelectBehavior.Select,
		}),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),

		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
			else
				fallback()
			end
		end,
	},
})

-- Loads snippets collection
require("luasnip/loaders/from_vscode").load()

return {}
