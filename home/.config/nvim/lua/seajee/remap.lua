-- Leader key
vim.g.mapleader = " "

-- Netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Terminal mode
vim.keymap.set("n", [[<leader>\]], vim.cmd.ToggleTerm)
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)

-- Move text in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move text on the same line
vim.keymap.set("n", "J", "mzJ`z")

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

-- Replace all
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Vim Grep
vim.keymap.set("n", "<leader>vs", [[:vimgrep // **/*<Left><Left><Left><Left><Left><Left>]])

-- Delete all marks
vim.keymap.set("n", "<leader>dm", ":delmarks!<CR>")

-- Make executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Manuals
vim.keymap.set("n", "<leader>m", "<cmd>:Man<CR>")

-- Tabs
vim.keymap.set("n", "<leader>tt", "<cmd>:tabnew<CR>")
vim.keymap.set("n", "<leader>tw", "<cmd>:tabc<CR>")
vim.keymap.set("n", "<leader>tn", "<cmd>:tabn<CR>")
vim.keymap.set("n", "<leader>tp", "<cmd>:tabp<CR>")
vim.keymap.set("n", "<leader>tr", "<cmd>:tabr<CR>")
vim.keymap.set("n", "<leader>tl", "<cmd>:tabl<CR>")
