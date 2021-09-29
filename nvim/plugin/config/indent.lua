vim.cmd [[
    highlight IndentBlanklineIndent1 guifg=#E06C75 blend=nocombine
    highlight IndentBlanklineIndent2 guifg=#E5C07B blend=nocombine
    highlight IndentBlanklineIndent3 guifg=#98C379 blend=nocombine
    highlight IndentBlanklineIndent4 guifg=#56B6C2 blend=nocombine
    highlight IndentBlanklineIndent5 guifg=#61AFEF blend=nocombine
    highlight IndentBlanklineIndent6 guifg=#C678DD blend=nocombine
]]

local indent = require('indent_blankline')

indent.setup {
    -- show_current_context = true,
    char = '│',
    buftype_exclude = {'terminal'},
    filetype_exclude = {'dashboard', 'NvimTree', 'packer', 'help', 'man', 'norg'},
    char_highlight_list = {
        'IndentBlanklineIndent1',
        'IndentBlanklineIndent2',
        'IndentBlanklineIndent3',
        'IndentBlanklineIndent4',
        'IndentBlanklineIndent5',
        'IndentBlanklineIndent6',
    },
    show_trailing_blankline_indent = false,

}
