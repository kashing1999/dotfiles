local lsp = require('lspconfig')
local remap = vim.api.nvim_set_keymap

-- python lsp
lsp.pylsp.setup{}

-- clang lsp
lsp.clangd.setup{}

-- rust lsp
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

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.rs",
    callback = function()
        -- auto format rust code on save
        vim.lsp.buf.format()
    end,
})

-- go lsp
lsp.gopls.setup {
    cmd = {"gopls"},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
            staticcheck = true,
        },
    },
}

-- diagnostic float config
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

function go_org_imports(wait_ms)
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
    for cid, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
            if r.edit then
                local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                vim.lsp.util.apply_workspace_edit(r.edit, enc)
            end
        end
    end
end

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.go",
    callback = function()
        -- auto format go code and organize imports on save
        vim.lsp.buf.format()
        go_org_imports(1000)
    end,
})
