if filereadable(expand('~/.config/nvim/plugins.vim'))
    source ~/.config/nvim/plugins.vim
endif

if filereadable(expand('~/.config/nvim/local.vim'))
    source ~/.config/nvim/local.vim
endif

" ============================================================
" General config
" ============================================================

" Use mouse
    set mouse=a

" Relative number
    set number relativenumber

" Tabs:
	set tabstop=4       " The width of a TAB is set to 4.
	set shiftwidth=4    " Indents will have a width of 4
	set softtabstop=4   " Sets the number of columns for a TAB
	set expandtab       " Expand TABs to spaces

" Colors
    colorscheme gruvbox-material

    set termguicolors
	set background=dark

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" Disables automatic commenting on newline
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right
	set splitbelow splitright

" ============================================================
" Native remaps
" ============================================================

" Map space to leader in normal mode:
    nmap <SPACE> <leader>

" Stop search highlight
	nnoremap <esc><esc> :nohl<return><esc>

" Don't put stuff deleted from c into buffer
    nnoremap c "_c

" Faster saving:
    nnoremap <leader>q <esc>:q<return>
    nnoremap <leader>w <esc>:w!<return><esc>

" Reload nvim config
    nnoremap <leader>sv :source $MYVIMRC<cr>

" Copy a line to clipboard
    nnoremap <leader>y "+yy


" Shortcutting split navigation, saving a keypress:
	nnoremap <leader>d <C-w>h
	nnoremap <leader>h <C-w>j
	nnoremap <leader>t <C-w>k
	nnoremap <leader>n <C-w>l

" Go to tab by number
    noremap <leader>1 1gt
    noremap <leader>2 2gt
    noremap <leader>3 3gt
    noremap <leader>4 4gt
    noremap <leader>5 5gt
    noremap <leader>6 6gt
    noremap <leader>7 7gt
    noremap <leader>8 8gt
    noremap <leader>9 9gt
    noremap <leader>0 :tablast<cr>

" Go to last active tab
    nnoremap <leader><Left>  :tabprevious<cr>
    nnoremap <leader><Right> :tabnext<cr>


" Resize window
    nnoremap <c-Left>  :vertical resize -5<cr>
    nnoremap <c-Down>  :resize +5<cr>
    nnoremap <c-Up>    :resize -5<cr>
    nnoremap <c-Right> :vertical resize +5<cr>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

    nnoremap <PageUp> <c-u>

" ============================================================
" Plugins config
" ============================================================

" jremmen/vim-ripgrep
" Use ripgrep to search for files
    nnoremap <leader>r :Rg -i ./%<Left><Left><Left><Left><space>

" szw/vim-maximizer
" Maximize a window
    nnoremap <leader>m :MaximizerToggle<cr>

" nvim-telescope/telescope.nvim
" Find files using Telescope command-line sugar.
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" ms-jpq/coq_nvim
" Blazing fast autocomplete
    let g:coq_settings = { 'auto_start': 'shut-up' }

" kyazdani42/nvim-tree.lua
    if filereadable(expand('~/.config/nvim/nvim_tree.vim'))
        source ~/.config/nvim/nvim_tree.vim
    endif

    nnoremap <leader>c :NvimTreeToggle<CR>
    nnoremap <leader>CC :NvimTreeRefresh<CR>
    nnoremap <leader>C :NvimTreeFindFile<CR>
    " NvimTreeOpen, NvimTreeClose and NvimTreeFocus are also available if you need them



" 'tversteeg/registers.nvim'
" Tool to view vim registers
    let g:registers_window_border = "rounded"

" 'glepnir/lspsaga.nvim'
" lsp-nvim frontend
    nnoremap <silent> gh :Lspsaga lsp_finder<cr>
    nnoremap <silent><leader>gca :Lspsaga code_action<cr>
    vnoremap <silent><leader>gca :<C-U>Lspsaga range_code_action<cr>
    nnoremap <silent>K :Lspsaga hover_doc<cr>
    " scroll down hover doc or scroll in definition preview
    nnoremap <silent> <PageDown> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>
    " scroll up hover doc
    nnoremap <silent> <PageUp> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>

    nnoremap <silent>gr :Lspsaga rename<CR>

" 'f-person/git-blame.nvim'
" git blame integration in vim
    let g:gitblame_enabled = 0
    nnoremap <silent> <leader>b :GitBlameToggle<CR>

" 'numtostr/FTerm.nvim'
" Floating terminal in vim
    nnoremap <C-e> <Cmd>lua require'FTerm'.toggle()<CR>
    tnoremap <C-e> <Cmd>lua require'FTerm'.toggle()<CR>

" Load config.lua
lua require('config')
