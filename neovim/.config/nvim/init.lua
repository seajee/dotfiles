-- [[ OPTIONS ]] --

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- File options
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/nvim_undodir"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.fixendofline = false

-- Tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.breakindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Columns
vim.opt.signcolumn = "yes"
vim.opt.textwidth = 78 -- RFC 5322
vim.opt.colorcolumn = "79"

-- Auto complete
vim.opt.completeopt = { "menuone", "popup" --[[, "noselect" ]] }

-- Colorscheme
vim.cmd.colorscheme("unokai")

-- [[ KEYMAPS ]] --

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")

-- Deletions
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")
vim.keymap.set("n", "<leader>dm", ":delmarks!<CR>")

-- Commands
vim.keymap.set("n", "<leader>x", ":!chmod +x %<CR>")
vim.keymap.set("n", "<leader>cd", ":cd %:h | pwd<CR>")

-- Move through quick fixes
vim.keymap.set("n", "<C-j>", ":cnext<CR>")
vim.keymap.set("n", "<C-k>", ":cprev<CR>")

-- Tabs
vim.keymap.set("n", "<leader>tt", ":tabnew<CR>")
vim.keymap.set("n", "<leader>tw", ":tabclose<CR>")
vim.keymap.set("n", "<leader>tn", ":tabnext<CR>")
vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>")
vim.keymap.set("n", "<leader>tf", ":tabfirst<CR>")
vim.keymap.set("n", "<leader>tl", ":tablast<CR>")

-- Buffers
vim.keymap.set("n", "<leader>bc", ":enew<CR>")
vim.keymap.set("n", "<leader>n", ":bnext<CR>")
vim.keymap.set("n", "<leader>p", ":bprevious<CR>")
vim.keymap.set("n", "<leader>\\", ":buffer term<CR>")
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")

-- Windows
vim.opt.winborder = "rounded"

-- Listchars
local listchars = {
    eol = "$",
    tab = "» ",
    space = "·",
    trail = "-"
}
vim.opt.listchars = listchars
vim.api.nvim_set_hl(0, "NonText", { fg = "#303030" })
vim.api.nvim_set_hl(0, "Whitespace", { fg = "#303030" })
vim.cmd.match([[TrailingWhitespace /\s\+$/]])

-- Toggle listchars
vim.keymap.set("n", "<leader>lc", function()
    vim.wo.list = not vim.wo.list
    if vim.wo.list then
        vim.api.nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })
    else
        vim.api.nvim_set_hl(0, "TrailingWhitespace", { link = "Whitespace" })
    end
end)
vim.api.nvim_create_autocmd({ "InsertEnter", "TermEnter" }, {
    callback = function()
        vim.opt.listchars.trail = nil
        vim.api.nvim_set_hl(0, "TrailingWhitespace", { link = "Whitespace" })
    end
})
vim.api.nvim_create_autocmd({ "InsertLeave", "TermLeave" }, {
    callback = function()
        vim.opt.listchars.trail = listchars.space
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
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
    -- Fuzzy finder
    { "echasnovski/mini.pick", opts = {} },

    -- Advanced undo tree
    { "mbbill/undotree" },

    -- Git integration
    { "tpope/vim-fugitive" },
    { "lewis6991/gitsigns.nvim", opts = {} }
})

-- Plugin keymaps
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>")
vim.keymap.set("n", "<leader>gs", ":Git<CR>")
vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_signs<CR>")
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>")
vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>")
