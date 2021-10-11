local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd 'packadd packer.nvim'
end

return require('packer').startup({function()
    use 'wbthomason/packer.nvim'
    use 'lewis6991/impatient.nvim'

    -- Neovim
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'

    -- Quality of life
    use 'tpope/vim-sensible'
    use 'jremmen/vim-ripgrep'
    use 'szw/vim-maximizer'
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function() require('config/indent') end
    }
    use 'p00f/nvim-ts-rainbow'
    use 'LionC/nest.nvim'
    use {
        'nvim-neorg/neorg',
        config = function() require('config/neorg') end
    }
    use {
        'beauwilliams/focus.nvim',
        config = function() require('config/focus') end
    }
    use {
        'kwkarlwang/bufresize.nvim',
        config = function() require('config/bufresize') end
    }
    use {
        'kevinhwang91/nvim-bqf',
        config = function() require('config/bqf') end
    }

    -- Text editing
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use {
        'ggandor/lightspeed.nvim',
        config = function() require('config/lightspeed') end
    }
    use {
        'windwp/nvim-autopairs',
        config = function() require('config/autopairs') end
    }

    -- Git
    use 'tpope/vim-fugitive'
    use 'f-person/git-blame.nvim'
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require('config/git') end
    }
    use 'sindrets/diffview.nvim'

    -- Color
    use 'sainnhe/gruvbox-material'
    use 'sainnhe/everforest'
    use {
        'norcalli/nvim-colorizer.lua',
        config = function() require('config/colorizer') end
    }
    use 'projekt0n/github-nvim-theme'
    use 'folke/lsp-colors.nvim'

    -- Ui elements:
    use 'kevinhwang91/nvim-hlslens'
    use {
        'romgrk/barbar.nvim',
        config = function() require('config/barbar') end
    }
    use {
        'kyazdani42/nvim-web-devicons',
        config = function() require('config/icons') end
    }
    use {
        'tversteeg/registers.nvim',
        config = function() require('config/registers') end
    }
    use 'hoob3rt/lualine.nvim'
    use {
        'akinsho/toggleterm.nvim',
        config = function() require('config/toggleterm') end
    }
    use {
        'glepnir/dashboard-nvim',
        config = function() require('config/dashboard') end
    }
    use {
        'kyazdani42/nvim-tree.lua',
        config = function() require('config/nvimtree') end

    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        config = function() require('config/telescope') end
    }
    use 'nvim-telescope/telescope-fzy-native.nvim'

    -- Lsp and syntax
    use { 'ms-jpq/coq_nvim', branch = 'coq' } -- main one
    use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }
    use 'simrat39/rust-tools.nvim'
    use {
        'neovim/nvim-lspconfig',
        config = function() require('config/lsp') end
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require('config/treesitter') end
    }
    use {
        'romgrk/nvim-treesitter-context',
        config = function() require('config/context') end
    }
    -- use 'mfussenegger/nvim-dap'

end,
config = {
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
}})
