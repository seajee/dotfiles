return require("packer").startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    use {
        "nvim-telescope/telescope.nvim", tag = "0.1.3",
      -- or                            , branch = "0.1.x",
        requires = { {"nvim-lua/plenary.nvim"} }
    }

    use "mbbill/undotree"

    use "ellisonleao/gruvbox.nvim"

    use {
        "akinsho/toggleterm.nvim", tag = "*"
    }

    use {
        "nvim-lualine/lualine.nvim",
        requires = { "nvim-tree/nvim-web-devicons", opt = true }
    }

    use {
        "nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" }
    }

    use "kshenoy/vim-signature"

    use "startup-nvim/startup.nvim"

    use "lewis6991/gitsigns.nvim"

    use "tpope/vim-fugitive"

    use "mg979/vim-visual-multi"

    use "numToStr/Comment.nvim"

    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        requires = {
            -- Manage the language servers from neovim
            {"williamboman/mason.nvim"},
            {"williamboman/mason-lspconfig.nvim"},
            -- LSP Support
            {"neovim/nvim-lspconfig"},
            -- Autocompletion
            {"hrsh7th/nvim-cmp"},
            {"hrsh7th/cmp-nvim-lsp"},
            {"L3MON4D3/LuaSnip"},
        }
    }

    use "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim"
end)
