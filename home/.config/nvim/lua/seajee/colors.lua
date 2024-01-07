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

-- Highlight trailing whitespaces only in NORMAL mode
--vim.cmd([[
--augroup HighlightWhitespace
--  autocmd!
--  autocmd CursorMoved * match errorMsg /\s\+$/
--  autocmd InsertEnter * match none
--  autocmd InsertLeave * match errorMsg /\s\+$/
--augroup END
--]])

-- Do not use vim background
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
