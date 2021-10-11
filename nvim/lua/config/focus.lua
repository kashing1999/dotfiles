local focus = require('focus')

vim.g.enabled_focus_resizing = 1
focus.setup({
    excluded_filetypes = {"toggleterm", "nvimtree", "dashboard", "qf"},
    -- hybridnumber = true,
    treewidth = 40
})
