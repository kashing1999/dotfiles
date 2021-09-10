local lualine = require('lualine')

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox_material',
    -- theme = 'everforest',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', {
      'diff',
      color_added = 'green',
      color_modified = 'yellow',
      color_removed = 'red'
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

  extensions = {'nvim-tree'}
}

