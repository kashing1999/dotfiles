local cmp = require('cmp')
local npairs = require('nvim-autopairs')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

npairs.setup({ map_bs = false })

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
