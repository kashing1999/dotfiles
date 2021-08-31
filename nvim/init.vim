if filereadable(expand('~/.config/nvim/plugins/plugins.vim'))
    source ~/.config/nvim/plugins/plugins.vim
endif

if filereadable(expand('~/.config/nvim/local.vim'))
    source ~/.config/nvim/local.vim
endif

" ============================================================
" General config
" ============================================================

" Use mouse
    set mouse=a

" Set hidden
    set hidden

" Relative number
    set number relativenumber

" Show current line
    set cursorline

" Tabs:
	set tabstop=4       " The width of a TAB is set to 4.
	set shiftwidth=4    " Indents will have a width of 4
	set softtabstop=4   " Sets the number of columns for a TAB
	set expandtab       " Expand TABs to spaces

" Colors

    set termguicolors
    let g:everforest_background = 'medium'
	set background=dark

    colorscheme everforest

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" Disables automatic commenting on newline
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right
	set splitbelow splitright

" ============================================================
" Plugins config
" ============================================================

" glepnir/dashboard-nvim
    let g:dashboard_default_executive ='telescope'
    let g:dashboard_custom_shortcut={
    \ 'last_session'       : 'SPC p l',
    \ 'find_history'       : 'SPC p h',
    \ 'find_file'          : 'SPC p f',
    \ 'new_file'           : 'SPC p n',
    \ 'change_colorscheme' : 'SPC p c',
    \ 'find_word'          : 'SPC p a',
    \ 'book_marks'         : 'SPC p b',
    \ }

" ms-jpq/coq_nvim
" Blazing fast autocomplete
    let g:coq_settings = { 'auto_start': 'shut-up' }

" kyazdani42/nvim-tree.lua
    if filereadable(expand('~/.config/nvim/plugins/config/nvim_tree.vim'))
        source ~/.config/nvim/plugins/config/nvim_tree.vim
    endif

" romgrk/barbar.nvim
    if filereadable(expand('~/.config/nvim/plugins/config/barbar.vim'))
        source ~/.config/nvim/plugins/config/barbar.vim
    endif

" 'tversteeg/registers.nvim'
" Tool to view vim registers
    let g:registers_window_border = "rounded"

" 'f-person/git-blame.nvim'
" git blame integration in vim
    let g:gitblame_enabled = 0

" Load config.lua
lua << EOF
    require('config')
    require('keymaps')
EOF
