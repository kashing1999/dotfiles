local indent = require('indent_blankline')

indent.setup {
    char = '▏',
    buftype_exclude = {'terminal'},
    filetype_exclude = {'startup', 'NvimTree', 'packer', 'help', 'man', 'norg', 'qf'},
    show_current_context = true,
    show_current_context_start = true,
}
