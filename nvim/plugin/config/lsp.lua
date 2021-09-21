local lsp = require('lspconfig')
local remap = vim.api.nvim_set_keymap

vim.g.coq_settings = {
    auto_start = 'shut-up',
    keymap = { recommended = false }
}

local coq = require('coq')

remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

lsp.pylsp.setup{
    coq.lsp_ensure_capabilities()
}

lsp.clangd.setup{
    coq.lsp_ensure_capabilities()
}

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

vim.cmd(
[[
    hi LspDiagnosticsVirtualTextError guifg       = #E06C75
    hi LspDiagnosticsVirtualTextWarning guifg     = #E5C07B
    hi LspDiagnosticsVirtualTextInformation guifg = #56B6C2
    hi LspDiagnosticsVirtualTextHint guifg        = #98C379
]])

vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]

require'nvim-lightbulb'.update_lightbulb {
    sign = {
        enabled = false,
    },
    virtual_text = {
        enabled = true,
        text = "",
    },
}
