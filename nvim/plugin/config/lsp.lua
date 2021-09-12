vim.g.coq_settings = { auto_start = 'shut-up' }

local coq = require('coq')

local lsp = require('lspconfig')

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
    -- coq.lsp_ensure_capabilities()
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
