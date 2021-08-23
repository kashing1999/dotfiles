if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'vimwiki/vimwiki'
Plug 'rbong/vim-crystalline'
Plug 'tpope/vim-commentary'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim', { 'tag': 'v1.7' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'iCyMind/NeoSolarized'
Plug 'preservim/nerdcommenter'
call plug#end()

set smartcase
set hlsearch
set mouse=a

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Some basics:
    set number relativenumber
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber

" Relative number:
	augroup numbertoggle
	  autocmd!
	  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
	augroup END

" Some remaps:
	nnoremap <esc><esc> :nohl<return><esc>
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

" Resize
    nnoremap <c-Left>  :vertical resize -5<cr>
    nnoremap <c-Down>  :resize +5<cr>
    nnoremap <c-Up>    :resize -5<cr>
    nnoremap <c-Right> :vertical resize +5<cr>

" Faster saving:
    nnoremap <leader>q <esc>:q<return>
    nnoremap <leader>w <esc>:w!<return><esc>
    cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Copy a line to clipboard
    nnoremap <leader>y "+yy

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

" Enable autocompletion:
	set wildmode=longest,list,full

" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Splits open at the bottom and right
	set splitbelow splitright

" Nerd tree:
	map <leader>p :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    let g:NERDTreeWinSize=35


" Check file in shellcheck:
	map <leader>s :!clear && shellcheck %<CR>

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
