local indent = require('indent_blankline')

vim.opt.listchars = {
    eol = "↴",
}

indent.setup {
    char = "|",
    buftype_exclude = {"terminal"},
    filetype_exclude = {"dashboard"},
    show_end_of_line = true,
}

