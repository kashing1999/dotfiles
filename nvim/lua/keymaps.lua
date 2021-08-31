local nest = require('nest')

nest.defaults = {
    mode = 'n',
    prefix = '',
    options = {
        noremap = true,
        silent = true,
    },
}

nest.applyKeymaps {
    -- Remap space to leader
    {'<space>', '<leader>' , options = { noremap = false }},

    -- Stop search highlight
    {'<esc><esc>', '<Cmd>nohl<CR>'},

    -- Don't put stuff deleted from c into buffer
    {'c', '"_c'},

    -- Replace all is aliased to S.
    {'S', ':%s//g<Left><Left>', options = { silent = false }},

    {'<PageUp>',   '<C-u>'},
    {'<PageDown>', '<C-d>'},

    -- szw/vim-maximizer
    -- Use ripgrep to search for files
    {'R', ':Rg -i ./%<Left><Left><Left><Left> ', options = { silent = false }},

    -- leader key remaps
    { '<leader>', {
        -- Faster save and quit
        {'q', '<Cmd>q<CR>'},
        {'w', '<Cmd>w!<CR>'},

        -- Reload nvim config
        {'sv', '<Cmd>source $MYVIMRC<CR>', options = { silent = false }},

        -- Copy a line to clipboard
        {'y', '"+yy'},

        -- Switch between buffers on screen
        {'d', '<C-w>h'},
        {'h', '<C-w>j'},
        {'t', '<C-w>k'},
        {'n', '<C-w>l'},

        -- Plug 'jremmen/vim-ripgrep'
        -- Maximize a buffer window
        {'m', '<Cmd>MaximizerToggle<CR>'},

        -- phaazon/hop.nvim
        -- Hops to a word
        {'.', '<Cmd>HopWord<CR>'},
        {',', '<Cmd>HopLine<CR>'},

        -- nvim-telescope/telescope.nvim
        -- Find files using Telescope command-line sugar.
        {'f', {
            {'f', '<Cmd>Telescope find_files<CR>'},
            {'g', '<Cmd>Telescope live_grep<CR>'},
            {'b', '<Cmd>Telescope buffers<CR>'},
            {'h', '<Cmd>Telescope help_tags<CR>'},
        }},

        -- 'f-person/git-blame.nvim'
        -- git blame integration in vim
        {'b', '<Cmd>GitBlameToggle<CR>', options = { silent = true }},

        -- kyazdani42/nvim-tree.lua
        {'c', '<Cmd> lua toggle()<CR>'},
        {'C', 'NvimTreeFindFile<CR>'},

        -- romgrk/barbar.nvim
        {'1', '<Cmd>BufferGoto 1<CR>'},
        {'2', '<Cmd>BufferGoto 2<CR>'},
        {'3', '<Cmd>BufferGoto 3<CR>'},
        {'4', '<Cmd>BufferGoto 4<CR>'},
        {'5', '<Cmd>BufferGoto 5<CR>'},
        {'6', '<Cmd>BufferGoto 6<CR>'},
        {'7', '<Cmd>BufferGoto 7<CR>'},
        {'8', '<Cmd>BufferGoto 8<CR>'},
        {'9', '<Cmd>BufferGoto 9<CR>'},
        {'0', '<Cmd>BufferLast<CR>'},

        {'<Left>',  '<Cmd>BufferPrevious<CR>'},
        {'<Right>', '<Cmd>BufferNext<CR>'},

        {'b', {
            {'b', '<Cmd>BufferOrderByBufferNumber<CR>'},
            {'d', '<Cmd>BufferOrderByDirectory<CR>'},
            {'l', '<Cmd>BufferOrderByLanguage<CR>'},
            {'w', '<Cmd>BufferOrderByWindowNumber<CR>'},
        }},

        -- glepnir/dashboard-nvim
        {'p', {
            {'h', '<Cmd>DashboardFindHistory<CR>'},
            {'f', '<Cmd>DashboardFindFile<CR>'},
            {'c', '<Cmd>DashboardChangeColorscheme<CR>'},
            {'a', '<Cmd>DashboardFindWord<CR>'},
            {'b', '<Cmd>DashboardJumpMark<CR>'},
            {'n', '<Cmd>DashboardNewFile<CR>'},
        }}
    }},

    { '<C-', {
        -- Resize window
        {'Left>',  '<Cmd>vertical resize -5<CR>'},
        {'Down>',  '<Cmd>resize +5<CR>'},
        {'Up>',    '<Cmd>resize -5<CR>'},
        {'Right>', '<Cmd>vertical resize +5<CR>'},

        -- 'numtostr/FTerm.nvim'
        -- Floating terminal in vim
        {'e>', '<Cmd>lua require"FTerm".toggle()<CR>'},
        {'e>', '<Cmd>lua require"FTerm".toggle()<CR>', mode = 't'},

        -- romgrk/barbar.nvim
        {'s>', '<Cmd>BufferPick<CR>'},
    }},

    { '<A-', {
        -- romgrk/barbar.nvim
        {',>', '<Cmd>BufferPrevious<CR>'},
        {'.>', '<Cmd>BufferNext<CR>'},
        {'<>', '<Cmd>BufferMovePrevious<CR>'},
        {'>>', '<Cmd>BufferMoveNext<CR>'},

        {'1>', '<Cmd>BufferGoto 1<CR>'},
        {'2>', '<Cmd>BufferGoto 2<CR>'},
        {'3>', '<Cmd>BufferGoto 3<CR>'},
        {'4>', '<Cmd>BufferGoto 4<CR>'},
        {'5>', '<Cmd>BufferGoto 5<CR>'},
        {'6>', '<Cmd>BufferGoto 6<CR>'},
        {'7>', '<Cmd>BufferGoto 7<CR>'},
        {'8>', '<Cmd>BufferGoto 8<CR>'},
        {'9>', '<Cmd>BufferGoto 9<CR>'},
        {'0>', '<Cmd>BufferLast<CR>'},

        {'p>', '<Cmd>BufferPin<CR>'},
        {'c>', '<Cmd>BufferClose<CR>'},
    }},
}
