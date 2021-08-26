local lsp = require "lspconfig"
local coq = require "coq"
local saga = require "lspsaga"
local fterm = require "FTerm"
local colorizer = require "colorizer"
local icons = require "nvim-web-devicons"
local treesitter = require "nvim-treesitter.configs"
local lualine = require "lualine"
local tabline = require "tabline"


-- lsp
lsp.pylsp.setup(coq.lsp_ensure_capabilities())
lsp.clangd.setup(coq.lsp_ensure_capabilities())

-- lspsaga
saga.init_lsp_saga {
    -- add your config value here
    -- default value
    use_saga_diagnostic_sign = true,
    error_sign = '',
    warn_sign = '',
    hint_sign = '',
    infor_sign = '',
    dianostic_header_icon = '   ',
    code_action_icon = ' ',
    code_action_prompt = {
      enable = true,
      sign = true,
      sign_priority = 20,
      virtual_text = true,
    },
    finder_definition_icon = '  ',
    finder_reference_icon = '  ',
    max_preview_lines = 30, -- preview lines of lsp_finder and definition preview
    finder_action_keys = {
       open = 'o', vsplit = 's',split = 'i',quit = 'q'
    },
    code_action_keys = {
      quit = 'q',exec = '<CR>'
    },
    rename_action_keys = {
      quit = '<C-c>',exec = '<CR>'  -- quit can be a table
    },
    definition_preview_icon = '  ',
    -- "single" "double" "round" "plus"
    border_style = "round",
    rename_prompt_prefix = '➤',
}

-- fterm
fterm.setup({
    dimensions  = {
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5
    },
    border = 'double' -- or 'double'
})

-- colorizer
colorizer.setup()

-- tabline
tabline.setup{}

-- icons
icons.setup {
     -- your personnal icons can go here (to override)
     -- DevIcon will be appended to `name`
     override = {
      zsh = {
        icon = "",
        color = "#428850",
        name = "Zsh"
      }
     };
     -- globally enable default icons (default to false)
     -- will get overriden by `get_icons` option
     default = true;
}

-- treesitter setup
treesitter.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true,
  },
}

-- lualine
lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox_material',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

