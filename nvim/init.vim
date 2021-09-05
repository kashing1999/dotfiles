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
	set background=dark
    let g:everforest_background = 'medium'
    let g:gruvbox_material_disable_italic_comment = 1

    colorscheme gruvbox-material

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" Disables automatic commenting on newline
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right
	set splitbelow splitright

" Live substitution
    set inccommand=nosplit

" ============================================================
" Plugins config
" ============================================================

" glepnir/dashboard-nvim
    let g:dashboard_default_executive ='telescope'
    let g:dashboard_custom_shortcut={
    \ 'last_session'       : 'SPC p l',
    \ 'find_file'          : 'SPC f f',
    \ 'change_colorscheme' : 'SPC f c',
    \ 'find_history'       : 'SPC p h',
    \ 'new_file'           : 'SPC p n',
    \ 'find_word'          : 'SPC p a',
    \ 'book_marks'         : 'SPC p b',
    \ }
    let g:dashboard_custom_header = [
    \ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
    \ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
    \ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
    \ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
    \ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
    \ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
    \]

" ms-jpq/coq_nvim
" Blazing fast autocomplete
    let g:coq_settings = { 'auto_start': 'shut-up' }

" 'tversteeg/registers.nvim'
    let g:registers_window_border = "rounded"

" 'f-person/git-blame.nvim'
    let g:gitblame_enabled = 0

" ============================================================
" Load lua configs
" ============================================================
lua << EOF
    require('config')
    require('keymaps')
EOF
