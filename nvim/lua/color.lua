local color = 'catppuccin'

vim.api.nvim_create_autocmd("colorscheme", {
    pattern = "*",
    callback = function(args)
        vim.api.nvim_set_hl(0, "EoLSpace", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "MatchParen", { fg = vim.api.nvim_get_hl_by_name("Search", true).foreground, bg = vim.api.nvim_get_hl_by_name("Search", true).background })
        vim.api.nvim_set_hl(0, "CursorColumn", { fg = vim.api.nvim_get_hl_by_name("ColorColumn", true).foreground, bg = vim.api.nvim_get_hl_by_name("ColorColumn", true).background })
    end,
})

vim.cmd('colorscheme ' .. color)
vim.opt.background = 'dark'

local lualine = require('config/lualine')
lualine.setup('auto')
