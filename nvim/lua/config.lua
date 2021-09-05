local colorizer = require('colorizer')
local icons = require('nvim-web-devicons')
local indent = require('indent_blankline')
local autopairs = require('nvim-autopairs')
local impatient = require('impatient')

colorizer.setup()

autopairs.setup()

icons.setup {
     -- your personnal icons can go here (to override)
     -- DevIcon will be appended to `name`
     override = {
      zsh = {
        icon = "",
        color = "#428850",
        name = "Zsh"
      }
     };
}

vim.opt.listchars = {
    eol = "↴",
}

indent.setup {
    char = "|",
    buftype_exclude = {"terminal"},
    filetype_exclude = {"dashboard"},
    show_end_of_line = true,
}

-- Config files for big extensions
require('plugins/barbar')
require('plugins/git')
require('plugins/lsp')
require('plugins/lualine')
require('plugins/neorg')
require('plugins/nvimtree')
require('plugins/telescope')
require('plugins/toggleterm')
require('plugins/treesitter')
