-- @Project: FiveM Tools
-- @License: GNU General Public License v3.0

-- Constructor
Commands = {}

-- Add commande
function AddCommand(prefix, permissionLevel, callback, callbackFailed)

  Commands[prefix] = {
    permissionLevel = permissionLevel, -- Min permision for use this command
    callback = callback, -- Function success
    callbackFailed = callbackFailed, -- Function failed
  }

end

-- Simple command no failed callback
RegisterServerEvent('ft_gamemode:SvAddSimpleCommand')
AddEventHandler('ft_gamemode:SvAddSimpleCommand', function(prefix, permissionLevel, callback)

  AddCommand(prefix, permissionLevel, callback, "")

end)

-- AdvancedC command failed callback
RegisterServerEvent('ft_gamemode:SvAddAdvancedCommand')
AddEventHandler('ft_gamemode:SvAddCommand', function(prefix, permissionLevel, callback, callbackfailed)

  AddCommand(prefix, permissionLevel, callback, callbackfailed)

end)
