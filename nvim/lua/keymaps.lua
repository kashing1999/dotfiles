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

    -- lsgsaga
    {"gh", "<cmd>Lspsaga lsp_finder<CR>"},

    -- Stop search highlight
    {'<esc><esc>', ':noh<CR>'},

    {'<BS>', [[<c-^>\'"zz"]]},

    -- Use ripgrep to search for files
    {'R', ':Rg -i %<Left><Left><Left><Left><Left> ', options = { silent = false }},

    -- leader key remaps
    { '<leader>', {
        -- Faster save and quit
        {'q', '<Cmd>q<CR>'},
        {'w', '<Cmd>w!<CR>'},

        {'y', '"+y'},

        {'v', '<Cmd>vsplit<CR>'},
        {'h', '<Cmd>split<CR>'},

        {'m', '<Cmd>MaximizerToggle<CR>'},

        {'l', {
            {'l', '<Cmd>set list<CR>'},
            {'n', '<Cmd>set nolist<CR>'},
        }};

        {'r', '<Cmd>Telescope lsp_references<CR>'},
        {'d', '<Cmd>Telescope lsp_definitions<CR>'},
        {'s', '<Cmd>Telescope lsp_document_symbols<CR>'},
        {'a', '<Cmd>Lspsaga code_action<CR>'},
        {'e', '<Cmd>lua vim.diagnostic.open_float()<CR>'},

        {'b', '<Cmd>Gitsigns toggle_current_line_blame<CR>'},
        {'B', '<Cmd>lua require"gitsigns".blame_line()<CR>'},

        {'g', {
            {'g', '<Cmd>Git<CR>'},

            {'c', '<Cmd>Telescope git_bcommits<CR>'},
            {'C', '<Cmd>Telescope git_commits<CR>'},
            {'b', '<Cmd>Telescope git_branches<CR>'},
            {'s', '<Cmd>Telescope git_status<CR>'},

        }};

        -- change root directory
        {'cd', '<Cmd>lcd %:p:h<CR>', options = { silent = false }},
        {'pwd', '<Cmd>pwd<CR>', options = { silent = false }},

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
    }},

    -- nvim-telescope/telescope.nvim
    -- Find files using Telescope command-line sugar.
    { '<esc>', {
        {'f', '<Cmd>lua require"telescope.builtin".find_files{no_ignore=true, hidden=true}<CR>'},
        {'g', '<Cmd>Telescope live_grep<CR>'},
        {'b', '<Cmd>Telescope buffers<CR>'},
        {'t', '<Cmd>Telescope treesitter<CR>'},

        {'h', '<Cmd>Telescope help_tags<CR>'},
        {'m', '<Cmd>Telescope man_pages<CR>'},
    }},

    { '<C-', {
        -- Navigate splits
        {'Left>',  '<C-w>h'},
        {'Down>',  '<C-w>j'},
        {'Up>',    '<C-w>k'},
        {'Right>', '<C-w>l'},

        --Nvim tree focus
        {'c>', '<Cmd>NvimTreeToggle<CR>'},

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
        {'<space>a', ":<C-U>Lspsaga code_action<CR>"},
    }},
}
