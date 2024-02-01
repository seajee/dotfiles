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
end)
