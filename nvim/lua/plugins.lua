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
    -- Color
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require('config/catppuccin')
            require('color')
        end,
        build = ":CatppuccinCompile",
    },
    {
        'norcalli/nvim-colorizer.lua',
        config = function() require('colorizer').setup() end
    },

    -- Quality of life
    'jremmen/vim-ripgrep',
    'szw/vim-maximizer',
    'p00f/nvim-ts-rainbow',
    'LionC/nest.nvim',
    'lambdalisue/suda.vim',
    {
        'lukas-reineke/indent-blankline.nvim',
        config = function() require('config/indent') end,
        event = "BufReadPre",

    },
    {
        'kevinhwang91/nvim-bqf',
        config = function() require('bqf').setup({ auto_enable = true })
        end
    },
    {
        'yamatsum/nvim-cursorline',
        config = function() require('config/cursorline') end
    },
    {
        'luukvbaal/stabilize.nvim',
        config = function() require("stabilize").setup() end
    },


    -- Text editing
    'tpope/vim-commentary',
    {
        'kylechui/nvim-surround',
        config = function() require("nvim-surround").setup() end
    },
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
        config = function() require('config/nvimtree') end,
        cmd = "NvimTreeToggle"
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = function() require('config/telescope') end
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim', build = 'make'
    },

    -- Lsp
    'simrat39/rust-tools.nvim',
    {
        'ms-jpq/coq_nvim', branch = 'coq'
    },
    {
        'ms-jpq/coq.artifacts', branch = 'artifacts'
    },
    {
        'neovim/nvim-lspconfig',
        lazy = false,
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
