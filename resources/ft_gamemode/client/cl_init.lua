-- @Project: FiveM Tools
-- @License: GNU General Public License v3.0

-- Init player --
Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)

    -- Complet join this server
    if NetworkIsSessionStarted() then

      -- Players --
      Player = {}

      -- Events --
      TriggerServerEvent('ft_gamemode:SvFirstJoinProper') -- send to server
      TriggerEvent('ft_gamemode:ClFirstJoinProper') -- send to client

      -- Set text in menu
      if Config.name ~= nil then
        Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), "FE_THDR_GTAO", Config.name)
      end

      break
    end
  end
end)

-- Spawn override
AddEventHandler('onClientMapStart', function()
  Citizen.CreateThread(function()

    exports.spawnmanager:setAutoSpawn(true)
    exports.spawnmanager:forceRespawn()

  end)
end)
