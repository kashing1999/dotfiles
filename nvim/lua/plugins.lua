local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

return require('lazy').setup({
    -- 'lewis6991/impatient.nvim',

    -- Neovim
    'nvim-lua/plenary.nvim',

    -- Quality of life
    'jremmen/vim-ripgrep',
    'szw/vim-maximizer',
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function() require('config/indent') end
    },
    'p00f/nvim-ts-rainbow',
    'LionC/nest.nvim',
    {
        'kevinhwang91/nvim-bqf',
        config = function() require('bqf').setup({ auto_enable = true })
        end
    },
    'lambdalisue/suda.vim',
    {
        'yamatsum/nvim-cursorline',
        config = function() require('config/cursorline') end
    },

    -- Text editing
    {
        'kylechui/nvim-surround',
        config = function() require("nvim-surround").setup() end
    },
    'tpope/vim-commentary',
    {
        'ggandor/lightspeed.nvim',
        config = function() require('config/lightspeed') end
    },
    {
        'windwp/nvim-autopairs',
        config = function() require('config/autopairs') end
    },

    -- Git
    'tpope/vim-fugitive',
    {
        'lewis6991/gitsigns.nvim',
        config = function() require('config/git') end
    },

    -- Color
    'sainnhe/gruvbox-material',
    'sainnhe/everforest',
    {
        "catppuccin/nvim",
        config = function() require('config/catppuccin') end,
        build = ":CatppuccinCompile",
    },
    {
        'norcalli/nvim-colorizer.lua',
        config = function() require('colorizer').setup() end
    },

    -- Ui
    {
        'kevinhwang91/nvim-hlslens',
        config = function() require('hlslens').setup() end
    },
    {
        'romgrk/barbar.nvim',
        config = function() require('config/barbar') end
    },
    {
        'kyazdani42/nvim-web-devicons',
        config = function() require('nvim-web-devicons').setup() end
    },
    {
        'tversteeg/registers.nvim',
        config = function()
            require("registers").setup({
                window = {
                    border = "rounded"
                }
            })
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        config = function() require('config/lualine').setup('auto') end
    },
    {
        'akinsho/toggleterm.nvim',
        config = function() require('config/toggleterm') end
    },
    {
        'startup-nvim/startup.nvim',
        config = function() require('config/startup') end
    },
    {
        'kyazdani42/nvim-tree.lua',
        cmd = "NvimTreeToggle",
        config = function() require('config/nvimtree') end
    },

    {
        'luukvbaal/stabilize.nvim',
        config = function() require("stabilize").setup() end
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        config = function() require('config/telescope') end
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim', build = 'make'
    },

    -- Lsp
    {
        'ms-jpq/coq_nvim', branch = 'coq'
    },
    {
        'ms-jpq/coq.artifacts', branch = 'artifacts'
    },
    'simrat39/rust-tools.nvim',
    {
        'neovim/nvim-lspconfig',
        config = function() require('config/lsp') end
    },
    {
        'glepnir/lspsaga.nvim',
        config = function() require('config/lspsaga') end
    },
    {
        'j-hui/fidget.nvim',
        config = function() require('fidget').setup() end
    },
    {
        'ray-x/go.nvim',
        config = function() require('go').setup() end
    },
    {
        'ray-x/lsp_signature.nvim',
        config = function() require('lsp_signature').setup(cfg) end
    },

    -- treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function() require('config/treesitter') end
    },
    {
        'romgrk/nvim-treesitter-context',
        config = function() require('treesitter-context').setup() end
    },
})
