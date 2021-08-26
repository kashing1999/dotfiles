if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')

    " Vim wiki
    Plug 'vimwiki/vimwiki'

    " Quality of life
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-sensible'
    Plug 'jiangmiao/auto-pairs'
    Plug 'jremmen/vim-ripgrep'
    Plug 'szw/vim-maximizer'
    Plug 'f-person/git-blame.nvim'

    " Ui
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'rktjmp/lush.nvim', { 'branch': 'main' }
    Plug 'iCyMind/NeoSolarized'
    Plug 'marko-cerovac/material.nvim', { 'branch': 'main' }
    Plug 'sainnhe/gruvbox-material'
    Plug 'ellisonleao/gruvbox.nvim', { 'branch': 'main' }
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
    Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
    Plug 'hoob3rt/lualine.nvim'
    Plug 'numtostr/FTerm.nvim'

    " Telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " Lsp and syntax
    Plug 'neovim/nvim-lspconfig'
    Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
    Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
    Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

call plug#end()
