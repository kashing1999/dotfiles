if vim.g.vscode then
    vim.keymap.set('n', ';', ':', {noremap = true})
else
    -- load plugins
    require('plugins')

    -- load default config
    require('settings')

    -- load local.lua
    require('local')

    -- load keymapping
    require('keymaps')
end
