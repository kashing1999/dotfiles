local lualine = require('lualine')

local vista = {}
vista.sections = {lualine_a = {'filetype'}}
vista.filetypes = {'vista'}

lualine.setup{
    options = {
        icons_enabled = true,
        theme = 'everforest',
        -- theme = 'gruvbox_material',
        -- theme = 'github',
        component_separators = {'', ''},
        section_separators = {'', ''},
        disabled_filetypes = {},
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', {
            'diff',
            color_added        = '#98C379',
            color_modified = '#E5C07B',
            color_removed    = '#E06C75',
        }},
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

    extensions = {vista, 'nvim-tree'},
}
