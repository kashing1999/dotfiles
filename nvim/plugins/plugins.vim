if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugins/plugged')

    " Quality of life
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-sensible'
    Plug 'windwp/nvim-autopairs'
    Plug 'jremmen/vim-ripgrep'
    Plug 'szw/vim-maximizer'
    Plug 'f-person/git-blame.nvim'
    Plug 'phaazon/hop.nvim'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'LionC/nest.nvim'

    " Ui
    Plug 'seblj/nvim-tabline'
    Plug 'romgrk/barbar.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
    Plug 'hoob3rt/lualine.nvim'
    Plug 'numtostr/FTerm.nvim'
    Plug 'glepnir/dashboard-nvim'

    " Color
    Plug 'rktjmp/lush.nvim', { 'branch': 'main' }
    Plug 'iCyMind/NeoSolarized'
    Plug 'marko-cerovac/material.nvim', { 'branch': 'main' }
    Plug 'sainnhe/gruvbox-material'
    Plug 'sainnhe/everforest'
    Plug 'norcalli/nvim-colorizer.lua'

    " Telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'

    " Lsp and syntax
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
    Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
    Plug 'ray-x/navigator.lua'
    Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
    Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

call plug#end()
