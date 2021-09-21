local sidebar = require("sidebar-nvim")

local opts = {
    open = false,
    sections = { "datetime", "git-status", "lsp-diagnostics", "todos" },
}

sidebar.setup(opts)
