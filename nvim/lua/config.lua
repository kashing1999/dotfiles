-- Relative numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Use mouse in all modes
vim.opt.mouse = 'a'

-- Set hidden
vim.opt.hidden = true

-- Tab conifg
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Colorscheme
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.g.gruvbox_material_disable_italic_comment = true
vim.cmd('colorscheme gruvbox-material')
-- vim.g.everforest_disable_italic_comment = true
-- vim.cmd('colorscheme everforest')

-- Splits open at the bottom and right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Live substitution
vim.opt.inccommand = 'nosplit'

-- Lazy redraw to improve performance
vim.opt.lazyredraw = true

vim.opt.cul = true

vim.cmd(
[[
    augroup Cul
        autocmd!
        autocmd WinEnter * set cul
        autocmd WinLeave * set nocul
    augroup END
]])
