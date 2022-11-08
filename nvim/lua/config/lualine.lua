funcs = {}
function funcs.setup (color)
    local lualine = require('lualine')

    lualine.setup{
        options = {
            icons_enabled = true,
            theme = color,
            -- theme = 'gruvbox_material',
            -- theme = 'github',
            -- component_separators = {'', ''},
            -- section_separators = {'', ''},
            section_separators = { left = '', right = ''},
            component_separators = { left = '', right = ''},
            disabled_filetypes = {},
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {
                'branch',
                {
                    'diff',
                    colored = true, -- displays diff status in color if set to true
                    -- all colors are in format #rrggbb
                    diff_color = {
                        added = {fg = '#98c379'},
                        modified = {fg = '#e5c07b'},
                        removed = {fg = '#e06c75'},
                    },
                    symbols = {added = '+', modified = '~', removed = '-'},
                    source = nil
                },
                {
                    'diagnostics',
                    source = {'nvim_diagnostic', 'nvim_lsp'}
                }
            },

            lualine_c = {{
                'filename',
                path = 1,
                file_status = true,
                newfile_status = false,
            }},
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

        extensions = {'nvim-tree', 'fugitive', 'quickfix', 'toggleterm'},
    }
end

return funcs
