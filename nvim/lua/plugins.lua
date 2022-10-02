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

  -- Toggleterm
  use({
    "akinsho/toggleterm.nvim",
    config = function()
      require("plugins/toggleterm").setup()
    end,
  })

  -- Highlight
  use("RRethy/vim-illuminate")

  -- Project managment
  use({
    "ahmedkhalf/project.nvim",
    config = function()
      require("plugins/project").setup()
    end,
  })

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

  -- Nvim tree
  use({
    "kyazdani42/nvim-tree.lua", -- nvim tree
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icon
    },
    tag = "nightly", -- optional, updated every week. (see issue #1193)
    config = function()
      require("plugins/nvim-tree").setup()
    end,
  })

  -- Git
  use({
    "lewis6991/gitsigns.nvim", -- gitsigns
    config = function()
      require("plugins/gitsigns").setup()
    end,
  })

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

  -- Neorg
  -- use({
  --   "nvim-neorg/neorg",
  --   config = function()
  --     require("plugins/neorg").setup()
  --   end,
  --   requires = "nvim-lua/plenary.nvim",
  -- })

  -- Tabline
  use({
    "kdheepak/tabline.nvim",
    config = function()
      require("plugins/tabline").setup()
    end,
  })

  -- Dashboard
  use({
    "glepnir/dashboard-nvim",
    config = function()
      require("plugins/dashboard").setup()
    end,
  })

  -- Colorschemes
  use("kristijanhusak/vim-hybrid-material")
end)
