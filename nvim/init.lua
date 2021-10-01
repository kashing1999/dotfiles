-- impatient

function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end

require('impatient')

if file_exists('lua/packer_compiled.lua') then
    require('packer_compiled')
end

-- load default config
require('config')

-- load local.lua
require('local')

-- load keymapping
require('keymaps')
