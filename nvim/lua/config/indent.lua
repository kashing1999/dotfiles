local indent = require('ibl')

indent.setup {
    indent = {
        char = '▏',
    },
    exclude = {
        filetypes = {'startup', 'NvimTree', 'packer', 'help', 'man', 'norg', 'qf'},
    },
}
