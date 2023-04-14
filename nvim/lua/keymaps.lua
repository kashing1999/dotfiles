-- Remap ; into :
vim.keymap.set('n', ';', ':', { noremap = true, silent = false } )

-- Smart dd which does not yank empty line
local function smart_delete()
    local current_line = vim.api.nvim_get_current_line()
    if current_line[1] == "" then
        return '"_dd'
    else
        return 'dd'
    end
end
vim.keymap.set( "n", "dd", smart_delete, { noremap = true, expr = true } )

-- Don't put stuff deleted from c into buffer
vim.keymap.set('n', 'c', '"_c')

-- Center line on insert mode
vim.keymap.set('n', 'i', 'zzi')
vim.keymap.set('n', 'I', 'zzI')
vim.keymap.set('n', 'a', 'zza')
vim.keymap.set('n', 'A', 'zzA')
vim.keymap.set('n', 'o', 'zzo')
vim.keymap.set('n', 'O', 'zzO')

-- Y yanks to end of line instead of whole line
vim.keymap.set('n', 'Y', 'y$')

-- nvim-hlslens
vim.keymap.set('n', 'n', "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>zzzv")
vim.keymap.set('n', 'N', "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>zzzv")
vim.keymap.set('n', '*', "*<Cmd>lua require('hlslens').start()<CR>")
vim.keymap.set('n', '#', "#<Cmd>lua require('hlslens').start()<CR>")
vim.keymap.set('n', 'g*', "g*<Cmd>lua require('hlslens').start()<CR>")
vim.keymap.set('n', 'g#', "g#<Cmd>lua require('hlslens').start()<CR>")

-- Stop search highlight
vim.keymap.set('n', '<esc><esc>', ':noh<CR>')

-- Alternate between last open buffer
vim.keymap.set('n', '<BS>', [[<c-^>\'"zz"]])

-- Use ripgrep to search for files
vim.keymap.set('n', 'R', ':Rg -i %<Left><Left><Left><Left><Left> ', { silent = false })

-- delete up to line
vim.keymap.set('n', 'dl', '0D')

-- Faster save and quit
vim.keymap.set('n', '<leader>q', '<Cmd>q<CR>')
vim.keymap.set('n', '<leader>w', '<Cmd>w!<CR>')

-- yank to clipboard
vim.keymap.set('n', '<leader>y', '"+y')

-- create new split
vim.keymap.set('n', '<leader>v', '<Cmd>vsplit<CR>')
vim.keymap.set('n', '<leader>h', '<Cmd>split<CR>')

-- toggle list chars
vim.keymap.set('n', '<leader>ll', '<Cmd>set list<CR>')
vim.keymap.set('n', '<leader>ln', '<Cmd>set nolist<CR>')

-- lspsaga
vim.keymap.set('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>')
vim.keymap.set('n', '<leader>n', '<cmd>Lspsaga rename<CR>')

-- telescope
vim.keymap.set('n', '<leader>r', '<Cmd>lua require"telescope.builtin".lsp_references{jump_type="never"}<CR>')
vim.keymap.set('n', '<leader>d', '<Cmd>Telescope lsp_definitions<CR>')
vim.keymap.set('n', '<leader>s', '<Cmd>Telescope lsp_document_symbols<CR>')
vim.keymap.set('n', '<leader>a', '<Cmd>Lspsaga code_action<CR>')
vim.keymap.set('n', '<leader>e', '<Cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', '<esc>f', '<Cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<esc>g', '<Cmd>Telescope live_grep<CR>')
vim.keymap.set('n', '<esc>b', '<Cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<esc>t', '<Cmd>Telescope treesitter<CR>')
vim.keymap.set('n', '<esc>h', '<Cmd>Telescope help_tags<CR>')
vim.keymap.set('n', '<esc>m', '<Cmd>Telescope man_pages<CR>')
vim.keymap.set('n', '<esc>r', '<Cmd>Telescope registers<CR>')

-- git
vim.keymap.set('n', '<leader>b', '<Cmd>Gitsigns toggle_current_line_blame<CR>')
vim.keymap.set('n', '<leader>B', '<Cmd>Gitsigns blame_line<CR>')
vim.keymap.set('n', '<leader>gg', '<Cmd>Git<CR>')
vim.keymap.set('n', '<leader>gc', '<Cmd>Telescope git_bcommits<CR>')
vim.keymap.set('n', '<leader>gC', '<Cmd>Telescope git_commits<CR>')
vim.keymap.set('n', '<leader>gb', '<Cmd>Telescope git_branches<CR>')
vim.keymap.set('n', '<leader>gs', '<Cmd>Telescope git_status<CR>')

-- tabs
vim.keymap.set('n', '<leader>1', '1gt')
vim.keymap.set('n', '<leader>2', '2gt')
vim.keymap.set('n', '<leader>3', '3gt')
vim.keymap.set('n', '<leader>4', '4gt')
vim.keymap.set('n', '<leader>5', '5gt')
vim.keymap.set('n', '<leader>6', '6gt')
vim.keymap.set('n', '<leader>7', '7gt')
vim.keymap.set('n', '<leader>8', '8gt')
vim.keymap.set('n', '<leader>9', '9gt')
vim.keymap.set('n', '<leader>0', '<Cmd>tablast<CR>')

-- Navigate splits
vim.keymap.set('n', '<C-Left>',  '<C-w>h')
vim.keymap.set('n', '<C-Down>',  '<C-w>j')
vim.keymap.set('n', '<C-Up>',    '<C-w>k')
vim.keymap.set('n', '<C-Right>', '<C-w>l')

--Nvim tree focus
vim.keymap.set('n', '<C-c>', '<Cmd>NvimTreeToggle<CR>')

-- Close tab
vim.keymap.set('n', '<C-x>', '<Cmd>tabclose<CR>')

-- Fold
vim.keymap.set('n', '<C-a>', 'za')

-- Replace all is aliased to S.
vim.keymap.set('n', '<C-s>', ':%s//g<Left><Left>', { silent = false })

-- Moving text
vim.keymap.set('n', '<C-j>', ':m .+1<CR>==')
vim.keymap.set('n', '<C-k>', ':m .-2<CR>==')

-- romgrk/barbar.nvim
vim.keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>')
vim.keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>')
vim.keymap.set('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>')
vim.keymap.set('n', '<A->>', '<Cmd>BufferMoveNext<CR>')

vim.keymap.set('n', '<A-1>', '<Cmd>BufferGoto 1<CR>')
vim.keymap.set('n', '<A-2>', '<Cmd>BufferGoto 2<CR>')
vim.keymap.set('n', '<A-3>', '<Cmd>BufferGoto 3<CR>')
vim.keymap.set('n', '<A-4>', '<Cmd>BufferGoto 4<CR>')
vim.keymap.set('n', '<A-5>', '<Cmd>BufferGoto 5<CR>')
vim.keymap.set('n', '<A-6>', '<Cmd>BufferGoto 6<CR>')
vim.keymap.set('n', '<A-7>', '<Cmd>BufferGoto 7<CR>')
vim.keymap.set('n', '<A-8>', '<Cmd>BufferGoto 8<CR>')
vim.keymap.set('n', '<A-9>', '<Cmd>BufferGoto 9<CR>')
vim.keymap.set('n', '<A-0>', '<Cmd>BufferLast<CR>')

vim.keymap.set('n', '<A-p>', '<Cmd>BufferPin<CR>')
vim.keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>')
vim.keymap.set('n', '<A-b>', '<Cmd>BufferOrderByBufferNumber<CR>')
vim.keymap.set('n', '<A-d>', '<Cmd>BufferOrderByDirectory<CR>')
vim.keymap.set('n', '<A-l>', '<Cmd>BufferOrderByLanguage<CR>')
vim.keymap.set('n', '<A-n>', '<Cmd>BufferOrderByWindowNumber<CR>')
vim.keymap.set('n', '<A-s>', '<Cmd>BufferPick<CR>')

-- Resize window
vim.keymap.set('n', '<A-Left>',  '<Cmd>vertical resize -5<CR>')
vim.keymap.set('n', '<A-Down>',  '<Cmd>resize +5<CR>')
vim.keymap.set('n', '<A-Up>',    '<Cmd>resize -5<CR>')
vim.keymap.set('n', '<A-Right>', '<Cmd>vertical resize +5<CR>')

-- undo breakpoints
vim.keymap.set('i', ',', ',<c-g>u')
vim.keymap.set('i', '.', '.<c-g>u')
vim.keymap.set('i', '!', '!<c-g>u')
vim.keymap.set('i', '?', '?<c-g>u')
vim.keymap.set('i', '(', '(<c-g>u')
vim.keymap.set('i', '{', '{<c-g>u')
vim.keymap.set('i', '[', '[<c-g>u')

vim.keymap.set('v', '<C-s>', ":s//g<Left><Left>", { silent = false })
vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', '<space>y', '"+y')
vim.keymap.set('v', '<space>a', ":<C-U>Lspsaga code_action<CR>")
