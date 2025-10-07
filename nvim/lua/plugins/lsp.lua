-- lsp servers
vim.lsp.enable('pyright')

vim.lsp.config['lual_lsp'] = { filetypes = { 'lua' } }
vim.lsp.enable('lual_lsp')

-- config completion menu
vim.o.completeopt = "menuone,noselect"

-- inject lsp capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- completion and snippets
local cmp = require("cmp")

local source_mapping = {
  buffer = "Buffer",
  nvim_lsp = "LSP",
  path = "Path",
}

-- setup cmp config
cmp.setup({
  sources = {
    {
      name = "nvim_lsp",
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
     else
	fallback()
     end
   end,
   ["<S-Tab>"] = function(fallback)
     if cmp.visible() then
	cmp.select_prev_item()
     else
	fallback()
     end
   end,
  },
})

-- Define diagnostic signs with explicit highlight groups
vim.fn.sign_define("DiagnosticSignError", {text = "E", texthl = "DiagnosticSignError", linehl = "", numhl = ""})
vim.fn.sign_define("DiagnosticSignWarn",  {text = "W", texthl = "DiagnosticSignWarn", linehl = "", numhl = ""})
vim.fn.sign_define("DiagnosticSignInfo",  {text = "I", texthl = "DiagnosticSignInfo", linehl = "", numhl = ""})
vim.fn.sign_define("DiagnosticSignHint",  {text = "H", texthl = "DiagnosticSignHint", linehl = "", numhl = ""})

-- Configure diagnostics display
vim.diagnostic.config({
  virtual_text = true,      -- Show diagnostic text after line (set to false if you don't want this)
  signs = true,             -- Show signs in signcolumn
  underline = true,         -- Underline the text with diagnostic error
  update_in_insert = false, -- Don't update diagnostics in insert mode
  severity_sort = true,     -- Sort by severity
})

return {}
