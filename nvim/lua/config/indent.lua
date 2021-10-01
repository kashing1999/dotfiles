local indent = require('indent_blankline')

indent.setup {
    -- show_current_context = true,
    char = '│',
    buftype_exclude = {'terminal'},
    filetype_exclude = {'dashboard', 'NvimTree', 'packer', 'help', 'man', 'norg', 'qf'},
    char_highlight_list = {
        'IndentBlanklineIndent1',
        'IndentBlanklineIndent2',
        'IndentBlanklineIndent3',
        'IndentBlanklineIndent4',
        'IndentBlanklineIndent5',
        'IndentBlanklineIndent6',
    },
}
