local lsp = require('lspconfig')
local remap = vim.api.nvim_set_keymap

vim.g.coq_settings = {
    auto_start = 'shut-up',
    keymap = { recommended = false }
}

local coq = require('coq')

remap('i', '<esc>',   [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
remap('i', '<c-c>',   [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
remap('i', '<tab>',   [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

lsp.pylsp.setup{
    coq.lsp_ensure_capabilities()
}

lsp.clangd.setup{
    coq.lsp_ensure_capabilities()
}

require('rust-tools').setup({
    tools = {
        runnables = {
            use_telescope = true,
        },
        inlay_hints = {
            auto = true,
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },
    server = {
        coq.lsp_ensure_capabilities(),
        settings = {
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy",
                },
            },
        }
    }
})

lsp.gopls.setup {
    cmd = {"gopls"},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
    coq.lsp_ensure_capabilities()
}

vim.diagnostic.config({
    virtual_text = true,
    signs = false,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

-- diagnostic float delay
-- vim.opt.updatetime = 500
-- vim.api.nvim_create_autocmd("CursorHold", {
--     callback = function()
--        vim.diagnostic.open_float(nil, { focusable = false })
--     end,
-- })

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.rs",
    callback = function()
       vim.lsp.buf.format()
    end,
})
