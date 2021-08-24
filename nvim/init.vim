if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'vimwiki/vimwiki'
Plug 'rbong/vim-crystalline'
Plug 'tpope/vim-commentary'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'iCyMind/NeoSolarized'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'jremmen/vim-ripgrep'
Plug 'szw/vim-maximizer'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

call plug#end()


let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Use mouse
    set mouse=a

" Relative number
    set number relativenumber
	augroup numbertoggle
	  autocmd!
	  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
	augroup END

" Stop search highlight
	nnoremap <esc><esc> :nohl<return><esc>

" Don't put stuff deleted from c into buffer
    nnoremap c "_c

" GUI
    set guifont=hack:h24

" remap motion
    nnoremap <PageUp>   <C-u>
    nnoremap <PageDown> <C-d>


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
    nnoremap <leader><Left>  :tabprevious<CR>
    nnoremap <leader><Right> :tabnext<CR>

" Resize window
    nnoremap <c-Left>  :vertical resize -5<cr>
    nnoremap <c-Down>  :resize +5<cr>
    nnoremap <c-Up>    :resize -5<cr>
    nnoremap <c-Right> :vertical resize +5<cr>

" Use ripgrep to search
    nnoremap <leader>r :Rg -i ./%<Left><Left><Left><Left><space>

" Faster saving:
    nnoremap <leader>q <esc>:q<return>
    nnoremap <leader>w <esc>:w!<return><esc>

" Copy a line to clipboard
    nnoremap <leader>y "+yy

" Find files using Telescope command-line sugar.
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" completion nvim
    " Use <Tab> and <S-Tab> to navigate through popup menu
    inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    " Set completeopt to have a better completion experience
    set completeopt=menuone,noinsert,noselect

    " Avoid showing message extra message when using completion
    set shortmess+=c

    let g:completion_enable_auto_popup = 1

" Map space to leader in normal mode:
    nmap <SPACE> <leader>

" Tabs:
	set tabstop=4       " The width of a TAB is set to 4.
	set shiftwidth=4    " Indents will have a width of 4
	set softtabstop=4   " Sets the number of columns for a TAB
	set expandtab       " Expand TABs to spaces

" Color:
    set termguicolors
	set background=dark

    " let g:jellybeans_overrides = {
    " \    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
    " \}
    " let g:jellybeans_overrides['background']['guibg'] = 'none'

	colorscheme gruvbox
	set t_Co=256

    if $TERM == 'st-256color'
        hi Normal guibg=NONE ctermbg=NONE
    elseif $TERM == 'screen-256color'
        hi Normal guibg=NONE ctermbg=NONE
    endif

" Neovide settings
    let g:neovide_refresh_rate=120
    let g:neovide_no_idle=v:true

" Disables automatic commenting on newline
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right
	set splitbelow splitright

" Nerd tree
	map <leader>p :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    let g:NERDTreeWinSize=35

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e

" Crystaline
    function! StatusLine(...)
      return crystalline#mode() . crystalline#right_mode_sep('')
            \ . ' %f%h%w%m%r ' . crystalline#right_sep('', 'Fill') . '%='
            \ . crystalline#left_sep('', 'Fill') . ' %{&ft}[%{&enc}][%{&ffs}] %l/%L %c%V %P '
    endfunction
    let g:crystalline_enable_sep = 1
    let g:crystalline_statusline_fn = 'StatusLine'
    let g:crystalline_theme = 'gruvbox'
    set laststatus=2


" Lua
lua << EOF
require'lspconfig'.pylsp.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.clangd.setup{on_attach=require'completion'.on_attach}

EOF
