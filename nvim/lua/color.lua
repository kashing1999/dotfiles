local color = 'catppuccin'

vim.api.nvim_create_autocmd("colorscheme", {
    pattern = "*",
    callback = function(args)
        vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = vim.api.nvim_get_hl_by_name("Function", true).foreground})
        vim.api.nvim_set_hl(0, "IndentBlanklineContextStart", { sp = vim.api.nvim_get_hl_by_name("Function", true).foreground, underline=true })
        vim.api.nvim_set_hl(0, "EoLSpace", { fg = "#E06C75" })
    end,
})

vim.cmd('colorscheme ' .. color)
vim.opt.background = 'dark'

local lualine = require('config/lualine')
lualine.setup('auto')
