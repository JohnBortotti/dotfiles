vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
  -- Utils
  use("wbthomason/packer.nvim") -- Package manager
  use("tpope/vim-surround")
  use("windwp/nvim-autopairs") -- Autopairs
  use("akinsho/toggleterm.nvim") -- Toggleterm
  use("RRethy/vim-illuminate") -- Highlight
  use("editorconfig/editorconfig-vim") -- Editorconfig

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
    "nvim-lualine/lualine.nvim", -- Lualine
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
  })

  -- Git
  use("lewis6991/gitsigns.nvim")

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

  -- Colorschemes
  use("navarasu/onedark.nvim")
  use("chriskempson/base16-vim")
  use("sainnhe/sonokai")

  -- Tree sitter
  use("nvim-treesitter/nvim-treesitter")

  -- Notify
  use({
    "rcarriga/nvim-notify",
    event = "VimEnter",
    config = function()
      vim.notify = require("notify")
    end,
  })
end)
