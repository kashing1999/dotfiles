local coq = require('coq')

require('rust-tools').setup({
    server = {
        coq.lsp_ensure_capabilities()
    }
})
