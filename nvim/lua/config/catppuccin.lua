local catppuccin = require("catppuccin")

vim.g.catppuccin_flavour = "macchiato"
catppuccin.setup({
    compile = {
        enabled = true,
        path = vim.fn.stdpath "cache" .. "/catppuccin"
    },
    integrations = {
        treesitter = true,
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
        },
        lsp_saga = true,
        gitsigns = true,
        telescope = true,
        nvimtree = {
            enabled = true,
            show_root = true,
            transparent_panel = false,
        },
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
        barbar = true,
        markdown = true,
        lightspeed = true,
        ts_rainbow = true,
    }
})
