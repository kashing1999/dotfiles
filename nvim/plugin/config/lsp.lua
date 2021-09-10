vim.g.coq_settings = { auto_start = 'shut-up' }

local coq = require('coq')

local lsp = require('lspconfig')
lsp.pylsp.setup(coq.lsp_ensure_capabilities())
lsp.clangd.setup(coq.lsp_ensure_capabilities())

local navigator = require('navigator')
navigator.setup({
  default_mapping = false,  -- set to false if you will remap every key
  treesitter_analysis = true, -- treesitter variable context
  transparency = 80, -- 0 ~ 100 blur the main window, 100: fully transparent, 0: opaque,  set to nil or 100 to disable it
  code_action_prompt = {enable = true, sign = true, sign_priority = 40, virtual_text = true},
  keymaps ={
      {key = "<leader>gca", mode = "n", func = "code_action()"},
      {key = "<leader>gcA", mode = "v", func = "range_code_action()"}
  },
  lsp = {
    format_on_save = false, -- set to false to disasble lsp code format on save (if you are using prettier/efm/formater etc)
  }
})

