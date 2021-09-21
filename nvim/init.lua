-- load default config
require('config')

-- load local.lua
require('local')

-- impatient
require('impatient')

-- load keymapping
require('keymaps')

if pcall(require, 'plenary') then
    RELOAD = require('plenary.reload').reload_module

    R = function(name)
      RELOAD(name)
      return require(name)
    end
end
