-- Fat cursor
vim.opt.guicursor = ""

-- Make cursor stay centered
--vim.opt.scrolloff = 8

-- Line relative number
vim.opt.nu = true
vim.opt.relativenumber = true

-- Use 4 spaces as tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Smart indentantion
vim.opt.smartindent = true

-- Swap file and undo file
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search highlighting
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Terminal colors
vim.opt.termguicolors = true

vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50
vim.opt.colorcolumn = "79" -- RFC 5322

-- Netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
