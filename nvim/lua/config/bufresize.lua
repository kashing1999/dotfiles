local bufresize = require("bufresize")

bufresize.setup({
    register = {
        keys = {},
        trigger_events = { "BufWinEnter", "WinEnter" },
    },
    resize = {
        keys = {},
        trigger_events = { "VimResized" },
    },
})
