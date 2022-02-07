local function prequire(m)
    local ok, err = pcall(require, m)
    if not ok then return nil, err end
    return err
end

-- load default config
require('settings')

-- load plugins and configs
require('impatient')

-- load local.lua
require('local')

require('packer_compiled')

-- load plugins
require('plugins')

-- load keymapping
require('keymaps')

-- color
require('color')
