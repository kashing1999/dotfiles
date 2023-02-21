local function prequire(m)
    local ok, err = pcall(require, m)
    if not ok then return nil, err end
    return err
end

-- load plugins and configs
prequire('impatient')

-- load default config
require('settings')

-- load plugins
require('plugins')

-- load local.lua
require('local')

-- prequire('packer_compiled')

-- load keymapping
require('keymaps')

-- color
require('color')
