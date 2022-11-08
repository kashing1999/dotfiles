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
    use 'nvim-lua/plenary.nvim'

    -- Quality of life
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
        'kevinhwang91/nvim-bqf',
        config = function() require('bqf').setup({ auto_enable = true })
        end
    }
    use 'lambdalisue/suda.vim'
    use {
        'yamatsum/nvim-cursorline',
        config = function() require('config/cursorline') end
    }

    -- Text editing
    use {
        'kylechui/nvim-surround',
        config = function() require("nvim-surround").setup() end
    }
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
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require('config/git') end
    }

    -- Color
    use 'sainnhe/gruvbox-material'
    use 'sainnhe/everforest'
    use({
        "catppuccin/nvim",
        as = "catppuccin",
        config = function() require('config/catppuccin') end,
        run = ":CatppuccinCompile",
    })
    use {
        'norcalli/nvim-colorizer.lua',
        config = function() require('colorizer').setup() end
    }

    -- Ui
    use {
        'kevinhwang91/nvim-hlslens',
        config = function() require('hlslens').setup() end
    }
    use {
        'romgrk/barbar.nvim',
        config = function() require('config/barbar') end
    }
    use {
        'kyazdani42/nvim-web-devicons',
        config = function() require('nvim-web-devicons').setup() end
    }
    use {
        'tversteeg/registers.nvim',
        config = function()
            require("registers").setup({
                window = {
                    border = "rounded"
                }
            })
        end
    }
    use {
        'nvim-lualine/lualine.nvim',
        config = function() require('config/lualine').setup('auto') end
    }
    use {
        'akinsho/toggleterm.nvim',
        config = function() require('config/toggleterm') end
    }
    use {
        'startup-nvim/startup.nvim',
        config = function() require('config/startup') end
    }
    use {
        'kyazdani42/nvim-tree.lua',
        config = function() require('config/nvimtree') end
    }

    use {
        'luukvbaal/stabilize.nvim',
        config = function() require("stabilize").setup() end
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        config = function() require('config/telescope') end
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- Lsp
    use { 'ms-jpq/coq_nvim', branch = 'coq' } -- main one
    use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }
    use 'simrat39/rust-tools.nvim'
    use {
        'neovim/nvim-lspconfig',
        config = function() require('config/lsp') end
    }
    use {
        'glepnir/lspsaga.nvim',
        config = function() require('config/lspsaga') end
    }
    use {
        'j-hui/fidget.nvim',
        config = function() require('fidget').setup{} end
    }

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function() require('config/treesitter') end
    }
    use {
        'romgrk/nvim-treesitter-context',
        config = function() require('treesitter-context').setup() end
    }
end,

config = {
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
}})
