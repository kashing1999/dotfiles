local lsp = require "lspconfig"
local coq = require "coq"
local fterm = require "FTerm"
local colorizer = require "colorizer"
local icons = require "nvim-web-devicons"
local treesitter = require "nvim-treesitter.configs"
local lualine = require "lualine"
local indent = require "indent_blankline"
local navigator = require "navigator"
local autopairs = require "nvim-autopairs"
local telescope = require "telescope"

-- lsp
lsp.pylsp.setup(coq.lsp_ensure_capabilities())
lsp.clangd.setup(coq.lsp_ensure_capabilities())

navigator.setup({
  default_mapping = true,  -- set to false if you will remap every key
  treesitter_analysis = true, -- treesitter variable context
  transparency = 80, -- 0 ~ 100 blur the main window, 100: fully transparent, 0: opaque,  set to nil or 100 to disable it
  code_action_prompt = {enable = true, sign = true, sign_priority = 40, virtual_text = true},
  keymaps ={
      {key = "<leader>gca", mode = "n", func = "code_action()"},
      {key = "<leader>gcA", mode = "v", func = "range_code_action()"}
  }
})

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

-- nvim autopairs
autopairs.setup()

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
     icons = {
       -- Code action
       code_action_icon = " ",
       -- code lens
       code_lens_action_icon = " ",
       -- Diagnostics
       diagnostic_head = '🐛',
       diagnostic_head_severity_1 = "🈲",
       diagnostic_head_severity_2 = "☣️",
       diagnostic_head_severity_3 = "👎",
       diagnostic_head_description = "📛",
       diagnostic_virtual_text = "🦊",
       diagnostic_file = "🚑",
       -- Values
       value_changed = "📝",
       value_definition = "🦕",
       -- Treesitter
       match_kinds = {
         var = " ", -- "👹", -- Vampaire
         method = "ƒ ", --  "🍔", -- mac
         ["function"] = " ", -- "🤣", -- Fun
         parameter = "  ", -- Pi
         associated = "🤝",
         namespace = "🚀",
         type = " ",
         field = "🏈"
       },
       treesitter_defult = "🌲"
     }
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
    theme = 'everforest',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {},
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
    lualine_x = {'filetype'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},

  extensions = {'nvim-tree'}
}

vim.opt.listchars = {
    eol = "↴",
}

indent.setup {
    char = "|",
    buftype_exclude = {"terminal"},
    filetype_exclude = {"dashboard"},
    show_end_of_line = true,
}

-- telescope
telescope.setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    winblend = 0,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    path_display = {},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
telescope.load_extension('fzy_native')
