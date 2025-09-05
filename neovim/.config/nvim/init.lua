-- Abbreviations
local opt = vim.opt
local map = vim.keymap.set
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
map("n", "<ESC>", "<cmd>nohlsearch<CR>")

-- Columns
opt.signcolumn = "yes"
opt.textwidth = 78 -- RFC 5322
opt.colorcolumn = "79"

-- Auto complete
opt.completeopt = { "menuone", "popup" --[[, "noselect" ]] }

-- Window border
opt.winborder = "rounded"

-- [[ KEYMAPS ]] --

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clipboard
map({ "n", "v" }, "<leader>y", "\"+y")

-- Deletions
map({ "n", "v" }, "<leader>d", "\"_d")
map("n", "<leader>dm", ":delmarks!<CR>")

-- Commands
map("n", "<leader>x", ":!chmod +x %<CR>")
map("n", "<leader>cd", ":cd %:h | pwd<CR>")

-- Tabs
map("n", "<leader>tt", ":tabnew<CR>")
map("n", "<leader>tw", ":tabclose<CR>")
map("n", "<leader>tn", ":tabnext<CR>")
map("n", "<leader>tp", ":tabprevious<CR>")
map("n", "<leader>tf", ":tabfirst<CR>")
map("n", "<leader>tl", ":tablast<CR>")

-- Buffers
map("n", "<leader>n", ":enew<CR>")
map("n", "<leader>db", ":bdelete<CR>")
map("n", "<TAB>", ":bnext<CR>")
map("n", "<S-TAB>", ":bprevious<CR>")
map("n", "<leader>\\", ":buffer term<CR>")
map("t", "<ESC>", "<C-\\><C-n>")

-- Indentation in visual mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move text in visual mode
map("v", "J", ":move '>+1<CR>gv=gv")
map("v", "K", ":move '<-2<CR>gv=gv")

-- Run last command in terminal
map("n", "<leader>r", ":buffer term<CR>i<Up><CR><C-\\><C-n>")

-- Window movement
map("n", "<M-h>", "<C-w>h")
map("n", "<M-j>", "<C-w>j")
map("n", "<M-k>", "<C-w>k")
map("n", "<M-l>", "<C-w>l")
map("t", "<M-h>", "<cmd>wincmd h<CR>")
map("t", "<M-j>", "<cmd>wincmd j<CR>")
map("t", "<M-k>", "<cmd>wincmd k<CR>")
map("t", "<M-l>", "<cmd>wincmd l<CR>")

-- Window resizing
map("n", "<M-Up>", "<cmd>resize -2<CR>")
map("n", "<M-Down>", "<cmd>resize +2<CR>")
map("n", "<M-Left>", "<cmd>vertical resize -2<CR>")
map("n", "<M-Right>", "<cmd>vertical resize +2<CR>")

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
map("n", "<leader>lc", function()
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
map("n", "<leader>f", ":Pick files<CR>")
map("n", "<leader>b", ":Pick buffers<CR>")
map("n", "<leader>u", ":UndotreeToggle<CR>")
map("n", "<leader>gs", ":Git<CR>")
map("n", "<leader>gt", ":Gitsigns toggle_signs<CR>")
map("n", "<leader>gp", ":Gitsigns preview_hunk<CR>")
map("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>")

-- Colorscheme
cmd.colorscheme("gruber-darker")
