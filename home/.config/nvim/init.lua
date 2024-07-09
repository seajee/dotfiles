-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- [[ Setting options ]]

-- Fat cursor
vim.opt.guicursor = ""

-- Make relative line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Use 4 spaces as tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Smart indentantion
vim.opt.smartindent = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/nvim_undodir"
vim.opt.swapfile = false
vim.opt.backup = false

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Incremental search
vim.opt.incsearch = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "79" -- RFC 5322

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor
vim.opt.list = false
vim.opt.listchars = { tab = "» ", space = "·", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "nosplit"

-- Show which line your cursor is on
vim.opt.cursorline = false

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 0

-- [[ Keymaps ]]

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move through quick fixes
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>")

-- Move text in visual mode
vim.keymap.set("v", "J", "<cmd>m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", "<cmd>m '<-2<CR>gv=gv")

-- Center screen with vim motions
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- System clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Delete without copying
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- Delete all marks
vim.keymap.set("n", "<leader>dm", "<cmd>delmarks!<CR>")

-- Toggle listchars
vim.keymap.set("n", "<leader>lc", "<cmd>set list<CR>")
vim.keymap.set("n", "<leader>ln", "<cmd>set nolist<CR>")

-- Make executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Change CWD for current tab
vim.keymap.set("n", "<leader>cd", "<cmd>cd %:h | pwd<CR>", { silent = true })

-- Tabs
vim.keymap.set("n", "<leader>tt", "<cmd>tabnew<CR>")
vim.keymap.set("n", "<leader>tw", "<cmd>tabc<CR>")
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>")
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>")
vim.keymap.set("n", "<leader>tr", "<cmd>tabr<CR>")
vim.keymap.set("n", "<leader>tl", "<cmd>tabl<CR>")

-- Buffers
vim.keymap.set("n", "<leader>bc", "<cmd>enew<CR>")
vim.keymap.set("n", "<leader>bn", "<cmd>bn<CR>")
vim.keymap.set("n", "<leader>bp", "<cmd>bp<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- [[ Install `lazy.nvim` plugin manager ]]

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]

require("lazy").setup({
    -- "gc" to comment visual regions/lines
    { "numToStr/Comment.nvim", opts = {} },

    -- Adds git related signs to the gutter, as well as utilities for managing changes
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
            vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>")
            vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
        end
    },

    -- Fuzzy Finder (files, lsp, etc)
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        end
    },

    -- Advanced Undo tree
    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },

    -- Custom Neovim status line
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    theme = "auto",
                    globalstatus = false,
                    component_separators = { left = "", right = "|" },
                    section_separators = { left = "|", right = "" }
                }
            })
        end
    },

    -- Colorscheme
    {
        "blazkowolf/gruber-darker.nvim",
        config = function()
            require("gruber-darker").setup({
                bold = false,
                invert = {
                    signs = false,
                    tabline = false,
                    visual = false,
                },
                italic = {
                    strings = false,
                    comments = false,
                    operators = false,
                    folds = false,
                },
                undercurl = true,
                underline = true,
            })
            vim.cmd.colorscheme("gruber-darker")
        end
    },

    -- Multi cursor editing
    { "mg979/vim-visual-multi" },

    -- Git integration
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gs", "<cmd>G<CR>")
        end
    },

    -- Place, toggle and display marks
    { "kshenoy/vim-signature" },

    -- Greeter
    {
        "startup-nvim/startup.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require("startup").setup({ theme = "startify" })
        end
    },

    -- LSP
    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-buffer",
            "L3MON4D3/LuaSnip",
        },
        branch = "v3.x",
        config = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.on_attach(function(client, bufnr)
                -- LSP keymaps
                lsp_zero.default_keymaps({ buffer = bufnr })

                local toggle_diagnostics = function()
                    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
                end
                vim.diagnostic.enable(false)

                vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", {buffer = bufnr})
                vim.keymap.set("n", "<leader>td", toggle_diagnostics)
            end)
            lsp_zero.set_server_config({
                on_init = function(client)
                    client.server_capabilities.semanticTokensProvider = nil
                end,
            })

            require("mason").setup({})
            require("mason-lspconfig").setup({
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({})
                    end
                }
            })

            local cmp = require("cmp")
            local cmp_format = require("lsp-zero").cmp_format({ details = true })

            cmp.setup({
                completion = {
                    autocomplete = false
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                },
                formatting = cmp_format,
            })
        end
    }
})
