-- Configure gruvbox colorscheme
require("gruvbox").setup({
    italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
    },
    -- TODO
    palette_overrides = {},
})

vim.cmd.colorscheme("gruvbox")

-- Do not use vim background
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Highlight whitespaces and traling whitespace
vim.cmd.set("list")
vim.cmd.set("listchars+=space:·")
vim.cmd.set("listchars+=trail:·")

-- Highlight tabs, eol (end-of-line), and non-breaking spaces
vim.cmd.set("listchars+=tab:\\→\\ ")
--vim.cmd.set("listchars+=eol:↴")
vim.cmd.set("listchars+=nbsp:_")

-- Highlight special characters, such as invisible characters (non-printable)
vim.cmd.set("listchars+=extends:>")
vim.cmd.set("listchars+=precedes:<")
vim.cmd.set("listchars+=nbsp:_")
