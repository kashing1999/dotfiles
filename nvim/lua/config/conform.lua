require("conform").setup({
  formatters_by_ft = {
    javascript = { "prettierd", stop_after_first = true },
    typescript = { "prettierd", stop_after_first = true },
  },
})
