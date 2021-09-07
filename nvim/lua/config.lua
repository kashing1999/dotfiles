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
-- vim.g.everforest_disable_italic_comment = true
vim.g.gruvbox_material_disable_italic_comment = true
vim.cmd('colorscheme gruvbox-material')

-- Splits open at the bottom and right
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Live substitution
vim.opt.inccommand = 'nosplit'

-- Disables automatic commenting on newline
vim.cmd('autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o')

-- Load configuration files for plugins
require('plugins/impatient')
require('plugins/autopairs')
require('plugins/barbar')
require('plugins/colorizer')
require('plugins/dashboard')
require('plugins/git')
require('plugins/icons')
require('plugins/indent')
require('plugins/lsp')
require('plugins/lualine')
require('plugins/neorg')
require('plugins/nvimtree')
require('plugins/registers')
require('plugins/telescope')
require('plugins/toggleterm')
require('plugins/treesitter')
