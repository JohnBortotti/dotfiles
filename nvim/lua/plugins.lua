vim.cmd([[packadd packer.nvim]])
return require("packer").startup(function()
  -- Utils --

  -- Package manager
  use("wbthomason/packer.nvim")

  use({
    "windwp/nvim-autopairs",
    config = function()
      require("plugins/autopairs").setup()
    end,
  })

  -- Highlight
  use("RRethy/vim-illuminate")


  -- Comment
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("plugins/comment").setup()
    end,
  })

  -- Lualine
  use({
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugins/lualine").setup()
    end,
  })

  use({
    "SmiteshP/nvim-gps", -- Lua line LSP infos provider
    config = function()
      require("nvim-gps").setup()
    end,
  })

  -- Nerdtree
  use("preservim/nerdtree")

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim", -- Telescope
    requires = { { "nvim-lua/plenary.nvim" } },
  })

  -- LSP
  use({ -- LSP config provider
    "neovim/nvim-lspconfig",
    opt = true,
    event = "BufReadPre",
    config = function()
      require("plugins/lsp").setup()
    end,
  })

  use("williamboman/nvim-lsp-installer") -- LSP Server Installer
  use("jose-elias-alvarez/null-ls.nvim") -- Null-ls

  -- CMP packages
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("saadparwaiz1/cmp_luasnip")
  use("ray-x/lsp_signature.nvim")
  use("onsails/lspkind-nvim")

  -- Snippets
  use("L3MON4D3/LuaSnip")
  use("rafamadriz/friendly-snippets")

  -- Tree sitter
  use({
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("plugins/treesitter").setup()
    end,
  })


  -- Colorschemes
end)
