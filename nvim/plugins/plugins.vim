if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugins/plugged')

    " Quality of life
    Plug 'lewis6991/impatient.nvim'
    Plug 'tpope/vim-sensible'
    Plug 'jremmen/vim-ripgrep'
    Plug 'szw/vim-maximizer'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'LionC/nest.nvim'
    Plug 'Vhyrro/neorg'

    " Text editing
    Plug 'phaazon/hop.nvim'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'windwp/nvim-autopairs'

    " Git
    Plug 'tpope/vim-fugitive'
    Plug 'f-person/git-blame.nvim'
    Plug 'lewis6991/gitsigns.nvim'

   " Ui elements
    Plug 'seblj/nvim-tabline'
    Plug 'romgrk/barbar.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'tversteeg/registers.nvim', { 'branch': 'main' }
    Plug 'hoob3rt/lualine.nvim'
    Plug 'akinsho/toggleterm.nvim'
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
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
    Plug 'ray-x/navigator.lua'
    Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
    Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

call plug#end()

" kyazdani42/nvim-tree.lua
    if filereadable(expand('~/.config/nvim/plugins/config/nvim_tree.vim'))
        source ~/.config/nvim/plugins/config/nvim_tree.vim
    endif

" romgrk/barbar.nvim
    if filereadable(expand('~/.config/nvim/plugins/config/barbar.vim'))
        source ~/.config/nvim/plugins/config/barbar.vim
    endif
