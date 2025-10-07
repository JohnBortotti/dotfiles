return {
  {
    "rebelot/kanagawa.nvim",
  },

  {
    "lewis6991/gitsigns.nvim",
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({})
    end,
  },
  
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
  
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      local treesitter = require("nvim-treesitter.configs")
        treesitter.setup({
	  sync_install = false,
	  highlight = {
	  enable = true,
	},
      })
    end,
  },
}
