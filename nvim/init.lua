local function prequire(m)
    local ok, err = pcall(require, m)
    if not ok then return nil, err end
    return err
end

-- load default config
require('settings')

-- load plugins and configs
prequire('impatient')

prequire('packer_compiled')

-- load local.lua
prequire('local')

-- load keymapping
require('keymaps')

-- load plugins
require('plugins')

-- color
require('color')
