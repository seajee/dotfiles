-- Abbreviations
local opt = vim.opt
local set = vim.keymap.set
local cmd = vim.cmd

-- [[ OPTIONS ]] --

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Block cursor
opt.guicursor = ""

-- File options
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/nvim_undodir"
opt.swapfile = false
opt.backup = false
opt.fixendofline = false

-- Tabs
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.breakindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Columns
opt.signcolumn = "yes"
opt.textwidth = 78 -- RFC 5322
opt.colorcolumn = "79"

-- Auto complete
opt.completeopt = { "menuone", "popup" --[[, "noselect" ]] }

-- [[ KEYMAPS ]] --

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clipboard
set({ "n", "v" }, "<leader>y", "\"+y")

-- Deletions
set({ "n", "v" }, "<leader>d", "\"_d")
set("n", "<leader>dm", ":delmarks!<CR>")

-- Commands
set("n", "<leader>x", ":!chmod +x %<CR>")
set("n", "<leader>cd", ":cd %:h | pwd<CR>")

-- Move through quick fixes
set("n", "<C-j>", ":cnext<CR>")
set("n", "<C-k>", ":cprev<CR>")

-- Tabs
set("n", "<leader>tt", ":tabnew<CR>")
set("n", "<leader>tw", ":tabclose<CR>")
set("n", "<leader>tn", ":tabnext<CR>")
set("n", "<leader>tp", ":tabprevious<CR>")
set("n", "<leader>tf", ":tabfirst<CR>")
set("n", "<leader>tl", ":tablast<CR>")

-- Buffers
set("n", "<leader>bc", ":enew<CR>")
set("n", "<leader>n", ":bnext<CR>")
set("n", "<leader>p", ":bprevious<CR>")
set("n", "<leader>\\", ":buffer term<CR>")
set("t", "<Esc>", "<C-\\><C-n>")

-- Run last command in terminal
set("n", "<leader>r", ":buffer term<CR>i<Up><CR><C-\\><C-n>")

-- Windows
opt.winborder = "rounded"

-- Listchars
local listchars = {
    -- eol = "$",
    tab = "» ",
    space = "·",
    trail = "-"
}
opt.listchars = listchars
vim.api.nvim_set_hl(0, "NonText", { fg = "#303030" })
vim.api.nvim_set_hl(0, "Whitespace", { fg = "#303030" })
cmd.match([[TrailingWhitespace /\s\+$/]])

-- Toggle listchars
set("n", "<leader>lc", function()
    vim.wo.list = not vim.wo.list
    if vim.wo.list then
        vim.api.nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })
    else
        vim.api.nvim_set_hl(0, "TrailingWhitespace", { link = "Whitespace" })
    end
end)
vim.api.nvim_create_autocmd({ "InsertEnter", "TermEnter" }, {
    callback = function()
        opt.listchars.trail = nil
        vim.api.nvim_set_hl(0, "TrailingWhitespace", { link = "Whitespace" })
    end
})
vim.api.nvim_create_autocmd({ "InsertLeave", "TermLeave" }, {
    callback = function()
        opt.listchars.trail = listchars.space
        vim.api.nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })
    end
})

-- [[ PLUGINS ]] --

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git", "clone", "--filter=blob:none", "--branch=stable",
        lazyrepo, lazypath
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
    -- Colorscheme
    {
        "blazkowolf/gruber-darker.nvim",
        opts = {
            italic = {
                strings = false,
                comments = false,
            }
        }
    },

    -- Fuzzy finder
    { "echasnovski/mini.pick", opts = {} },

    -- Advanced undo tree
    { "mbbill/undotree" },

    -- Git integration
    { "tpope/vim-fugitive" },
    { "lewis6991/gitsigns.nvim", opts = {} }
})

-- Plugin keymaps
set("n", "<leader>f", ":Pick files<CR>")
set("n", "<leader>u", ":UndotreeToggle<CR>")
set("n", "<leader>gs", ":Git<CR>")
set("n", "<leader>gt", ":Gitsigns toggle_signs<CR>")
set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>")
set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>")

-- Colorscheme
cmd.colorscheme("gruber-darker")
