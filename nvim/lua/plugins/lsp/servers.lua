-- lsp servers
-- https://github.com/neovim/nvim-lspconfig/tree/master/lua/lspconfig/server_configurations
require'lspconfig'.clangd.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.ocamllsp.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.pylsp.setup{}
require'lspconfig'.hls.setup{}