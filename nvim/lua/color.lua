local color = 'catppuccin'
-- local color = 'gruvbox_material'
-- local color = 'github'

-- vim.g.gruvbox_material_disable_italic_comment = true

vim.g.everforest_background = 'hard'
vim.g.everforest_disable_italic_comment = true

vim.api.nvim_create_autocmd("colorscheme", {
    pattern = "*",
    callback = function(args)
        vim.api.nvim_set_hl(0, "IndentBlanklineIndent1", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "IndentBlanklineIndent2", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "IndentBlanklineIndent3", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "IndentBlanklineIndent4", { fg = "#56B6C2" })
        vim.api.nvim_set_hl(0, "IndentBlanklineIndent5", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "IndentBlanklineIndent6", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "EoLSpace", { fg = "#E06C75" })
    end,
})

vim.cmd('colorscheme ' .. color)
vim.opt.background = 'dark'

local lualine = require('config/lualine')
lualine.setup('auto')
