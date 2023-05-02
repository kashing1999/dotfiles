-- use custom config
require('lspsaga').setup({
    ui = {
        code_action = "",
        border = "rounded"
    },
    lightbulb = {
        enable_in_insert = false,
        virtual_text = false,
        sign_priority = 20,
    },
})
