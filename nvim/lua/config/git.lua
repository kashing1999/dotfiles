local gitsigns = require('gitsigns')

-- gitsigns config
gitsigns.setup {
    signs = {
        add          = {text = '+', hl = 'GitSignsAdd'   , numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {text = '~', hl = 'GitSignsChange', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {text = '-', hl = 'GitSignsDelete', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {text = '‾', hl = 'GitSignsDelete', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {text = '~', hl = 'GitSignsChange', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    },
    current_line_blame = false,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 300,
    },
}
