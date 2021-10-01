local color = 'everforest'
-- local color = 'gruvbox_material'
-- local color = 'github'

-- vim.g.gruvbox_material_disable_italic_comment = true

vim.g.everforest_background = 'hard'
vim.g.everforest_disable_italic_comment = true
vim.cmd('colorscheme ' .. color)
vim.opt.background = 'dark'

local lualine = require('config/lualine')
lualine.setup(color)

vim.cmd([[
    function! OverrideHighlights() abort
        highlight IndentBlanklineIndent1 guifg=#E06C75
        highlight IndentBlanklineIndent2 guifg=#E5C07B
        highlight IndentBlanklineIndent3 guifg=#98C379
        highlight IndentBlanklineIndent4 guifg=#56B6C2
        highlight IndentBlanklineIndent5 guifg=#61AFEF
        highlight IndentBlanklineIndent6 guifg=#C678DD

        highlight LspDiagnosticsVirtualTextError       guifg = #E06C75
        highlight LspDiagnosticsVirtualTextWarning     guifg = #E5C07B
        highlight LspDiagnosticsVirtualTextInformation guifg = #56B6C2
        highlight LspDiagnosticsVirtualTextHint        guifg = #98C379
    endfunction

    augroup OverrideColors
        autocmd!
        autocmd ColorScheme * call OverrideHighlights()
    augroup END
]])
