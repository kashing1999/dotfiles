local color = 'everforest'
-- local theme = 'gruvbox_material'
-- local theme = 'github'
--
-- Colorscheme
vim.opt.background = 'dark'

-- vim.g.gruvbox_material_disable_italic_comment = true
-- vim.cmd('colorscheme gruvbox-material')

vim.g.everforest_background = 'hard'
vim.g.everforest_disable_italic_comment = true
vim.cmd('colorscheme ' .. color)

local lualine = require('config/lualine')
lualine.setup(color)
