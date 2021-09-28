local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd 'packadd packer.nvim'
end

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim'

    -- Neovim
    use 'nvim-lua/plenary.nvim'
    -- use {'lewis6991/impatient.nvim', rocks = 'mpack'}

    -- Quality of life
    use 'tpope/vim-sensible'
    use 'jremmen/vim-ripgrep'
    use 'szw/vim-maximizer'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'p00f/nvim-ts-rainbow'
    use 'LionC/nest.nvim'
    use 'Vhyrro/neorg'
    use 'beauwilliams/focus.nvim'
    use 'folke/todo-comments.nvim'
    use 'kwkarlwang/bufresize.nvim'
    use 'junegunn/fzf.vim'
    use 'stsewd/fzf-checkout.vim'

    -- Text editing
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use 'windwp/nvim-autopairs'
    use 'ggandor/lightspeed.nvim'

    -- Git
    use 'tpope/vim-fugitive'
    use 'f-person/git-blame.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'sindrets/diffview.nvim'

    -- Color
    use 'sainnhe/gruvbox-material'
    use 'sainnhe/everforest'
    use 'norcalli/nvim-colorizer.lua'
    use 'projekt0n/github-nvim-theme'

    -- Ui elements:
    use 'kevinhwang91/nvim-hlslens'
    use 'romgrk/barbar.nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'tversteeg/registers.nvim'
    use 'hoob3rt/lualine.nvim'
    use 'akinsho/toggleterm.nvim'
    use 'glepnir/dashboard-nvim'
    use 'GustavoKatel/sidebar.nvim'

    -- Telescope
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'

    -- Lsp and syntax
    use 'neovim/nvim-lspconfig'
    use 'liuchengxu/vista.vim'
    use 'kosayoda/nvim-lightbulb'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'ms-jpq/coq_nvim', branch = 'coq' } -- main one
    use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }
end)
