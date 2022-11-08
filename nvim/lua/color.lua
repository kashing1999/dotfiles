local color = 'catppuccin'

vim.api.nvim_create_autocmd("colorscheme", {
    pattern = "*",
    callback = function(args)
        vim.api.nvim_set_hl(0, "EolSpace", { fg = vim.api.nvim_get_hl_by_name("Error", true).foreground })
        vim.api.nvim_set_hl(0, "MatchParen", { bg = vim.api.nvim_get_hl_by_name("Search", true).background })
        vim.api.nvim_set_hl(0, "CursorColumn", { fg = vim.api.nvim_get_hl_by_name("ColorColumn", true).foreground, bg = vim.api.nvim_get_hl_by_name("ColorColumn", true).background })
        vim.cmd[[match EolSpace /\s\+$/"]]
    end,
})

vim.cmd('colorscheme ' .. color)
vim.opt.background = 'dark'

local lualine = require('config/lualine')
lualine.setup('auto')
