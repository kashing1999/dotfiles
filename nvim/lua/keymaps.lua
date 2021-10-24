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

    -- Remap ; into :
    {';', ':', options = { noremap = true, silent = false }},

    -- Don't put stuff deleted from c into buffer
    {'c', '"_c'},

    -- Center line on insert mode
    {'i', 'zzi'},
    {'I', 'zzI'},
    {'a', 'zza'},
    {'A', 'zzA'},
    {'o', 'zzo'},
    {'O', 'zzO'},

    -- Y yanks to end of line instead of whole line
    {'Y', 'y$'},

    -- nvim-hlslens
    {'n', "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>zzzv"},
    {'N', "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>zzzv"},
    {'*', "*<Cmd>lua require('hlslens').start()<CR>"},
    {'#', "#<Cmd>lua require('hlslens').start()<CR>"},
    {'g*', "g*<Cmd>lua require('hlslens').start()<CR>"},
    {'g#', "g#<Cmd>lua require('hlslens').start()<CR>"},

    -- Stop search highlight
    {'<esc><esc>', ':noh<CR>'},

    {'<BS>', [[<c-^>\'"zz"]]},

    -- szw/vim-maximizer
    -- Use ripgrep to search for files
    {'R', ':Rg -i %<Left><Left><Left><Left><Left> ', options = { silent = false }},

    -- leader key remaps
    { '<leader>', {
        -- Faster save and quit
        {'q', '<Cmd>q<CR>'},
        {'w', '<Cmd>w!<CR>'},

        -- Sidebar
        {'s', '<Cmd>SidebarNvimToggle<CR>'},

        -- Copy a line to clipboard
        {'y', '"+y'},

        -- Plug 'jremmen/vim-ripgrep'
        -- Maximize a buffer window
        {'m', '<Cmd>MaximizerToggle<CR>'},

        -- lewis6991/gitsigns.nvim
        {'b', '<Cmd>GitBlameToggle<CR>'},

        {'l', {
            {'l', '<Cmd>set list<CR>'},
            {'n', '<Cmd>set nolist<CR>'},
        }};

        -- f-person/git-blame.nvim
        {'g', {
            {'d', '<Cmd>DiffviewOpen<CR>'},

            {'g', '<Cmd>Git<CR>'},

            {'c', '<Cmd>Telescope git_bcommits<CR>'},
            {'C', '<Cmd>Telescope git_commits<CR>'},
            {'b', '<Cmd>Telescope git_branches<CR>'},
            {'s', '<Cmd>Telescope git_status<CR>'},

            {'h', '<Cmd>lua require"gitsigns".stage_hunk()<CR>'},
            {'h', '<Cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>', mode='v'},
            {'u', '<Cmd>lua require"gitsigns".undo_stage_hunk()<CR>'},
            {'r', '<Cmd>lua require"gitsigns".reset_hunk()<CR>'},
            {'r', '<Cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>', mode='v'},
            {'R', '<Cmd>lua require"gitsigns".reset_buffer()<CR>'},
            {'p', '<Cmd>lua require"gitsigns".preview_hunk()<CR>'},
            {'B', '<Cmd>lua require"gitsigns".blame_line(true)<CR>'},
            {'H', '<Cmd>lua require"gitsigns".stage_buffer()<CR>'},
            {'U', '<Cmd>lua require"gitsigns".reset_buffer_index()<CR>'},
        }};

        -- kyazdani42/nvim-tree.lua
        {'cc', '<Cmd>NvimTreeToggle<CR>'},
        {'cd', '<Cmd>lcd %:p:h<CR>', options = { silent = false }},
        {'cf', '<Cmd>NvimTreeFindFile<CR>'},

        -- liuchengxu/vista.vim
        {'v', '<Cmd>Vista!!<CR>'},

        -- tabs
        {'1', '1gt'},
        {'2', '2gt'},
        {'3', '3gt'},
        {'4', '4gt'},
        {'5', '5gt'},
        {'6', '6gt'},
        {'7', '7gt'},
        {'8', '8gt'},
        {'9', '9gt'},
        {'0', '<Cmd>tablast<CR>'},

        {'<Left>',  '<Cmd>BufferPrevious<CR>'},
        {'<Right>', '<Cmd>BufferNext<CR>'},

        -- glepnir/dashboard-nvim
        {'p', {
            {'s', '<Cmd>SessionSave<CR>'},
            {'l', '<Cmd>SessionLoad<CR>'},
            {'h', '<Cmd>DashboardFindHistory<CR>'},
            {'a', '<Cmd>DashboardFindWord<CR>'},
            {'b', '<Cmd>DashboardJumpMark<CR>'},
            {'n', '<Cmd>DashboardNewFile<CR>'},
            {'c', '<Cmd>DashboardChangeColorscheme<CR>'},
            {'f', '<Cmd>DashboardFindFile<CR>'},
        }},

    }},

    -- nvim-telescope/telescope.nvim
    -- Find files using Telescope command-line sugar.
    { '<esc>', {
        {'f', '<Cmd>Telescope find_files<CR>'},
        {'g', '<Cmd>Telescope live_grep<CR>'},
        {'b', '<Cmd>Telescope buffers<CR>'},

        {'h', '<Cmd>Telescope help_tags<CR>'},
        {'m', '<Cmd>Telescope man_pages<CR>'},

        {'q', '<Cmd>Telescope quickfix<CR>'},
        {'r', '<Cmd>Telescope lsp_references<CR>'},
        {'d', '<Cmd>Telescope lsp_definitions<CR>'},
        {'s', '<Cmd>Telescope lsp_document_symbols<CR>'},
        {'a', '<Cmd>Telescope lsp_code_actions<CR>'},

        {'c', '<Cmd>Telescope file_browser<CR>'},
        {'t', '<Cmd>Telescope treesitter<CR>'},
    }},

    { '<C-', {
        -- Resize window
        {'Left>',  '<C-w>h'},
        {'Down>',  '<C-w>j'},
        {'Up>',    '<C-w>k'},
        {'Right>', '<C-w>l'},

        --Nvim tree focus
        {'c>', '<Cmd>NvimTreeFocus<CR>'},

        -- Split nicely
        {'w>', '<Cmd>FocusSplitNicely<CR>'},
        {'w>', '<Cmd>vsplit<CR>'},

        -- Close tab
        {'x>', '<Cmd>tabclose<CR>'},

        -- Fold
        {'a>', 'za'},

        -- Replace all is aliased to S.
        {'s>', ':%s//g<Left><Left>', options = { silent = false }},

        -- Moving text
        {'j>', ':m .+1<CR>=='},
        {'k>', ':m .-2<CR>=='},
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
        {'b>', '<Cmd>BufferOrderByBufferNumber<CR>'},
        {'d>', '<Cmd>BufferOrderByDirectory<CR>'},
        {'l>', '<Cmd>BufferOrderByLanguage<CR>'},
        {'n>', '<Cmd>BufferOrderByWindowNumber<CR>'},
        {'s>', '<Cmd>BufferPick<CR>'},
        {'w>', '<Cmd>split<CR>'},


        -- Resize window
        {'Left>',  '<Cmd>vertical resize -5<CR>'},
        {'Down>',  '<Cmd>resize +5<CR>'},
        {'Up>',    '<Cmd>resize -5<CR>'},
        {'Right>', '<Cmd>vertical resize +5<CR>'},
    }},

    { mode = 'i', {
        {',', ',<c-g>u'},
        {'.', '.<c-g>u'},
        {'!', '!<c-g>u'},
        {'?', '?<c-g>u'},
        {'(', '(<c-g>u'},
        {'{', '{<c-g>u'},
        {'[', '[<c-g>u'},
    }},

    { mode = 'v', {
        {'<C-s>', ":s//g<Left><Left>", options = { silent = false }},
        {'<C-j>', ":m '>+1<CR>gv=gv"},
        {'<C-k>', ":m '<-2<CR>gv=gv"},
        {'<space>y', '"+y'},
    }},
}
