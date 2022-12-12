vim.cmd([[packadd packer.nvim]])
return require("packer").startup(function()
    -- Package manager
    use("wbthomason/packer.nvim")

    -- Autopairs
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("plugins/autopairs").setup()
        end
    })

    -- Comment
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("plugins/comment").setup()
        end
    })

    -- Lualine
    use({
        "nvim-lualine/lualine.nvim",
        config = function()
            require("plugins/lualine").setup()
        end
    })

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        requires = {{"nvim-lua/plenary.nvim"}}
    })

    -- LSP
    -- LSPconfig layer for nvim-lsp
    use('neovim/nvim-lspconfig')

    -- Completion engine
    use('hrsh7th/nvim-cmp')

    -- Completion with lsp capabilities
    use('hrsh7th/cmp-nvim-lsp')

    -- Completion with buffer data
    use('hrsh7th/cmp-buffer')

    -- Completion with filesystem paths
    use('hrsh7th/cmp-path')

    -- Sinppets
    use('L3MON4D3/LuaSnip')
    use('saadparwaiz1/cmp_luasnip')

    -- Snippets collection
    use('rafamadriz/friendly-snippets')

    -- Function Signatures
    use('ray-x/lsp_signature.nvim')

    -- LSP server installer
    use({
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    })

    --- end LSP

    -- Tree sitter
    use({
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("plugins/treesitter").setup()
        end
    })

    -- Colorschemes
end)
