-- @Project: FiveM Tools
-- @License: GNU General Public License v3.0

-- Load lib MySQL --
--require "resources/mysql-async/lib/MySQL"

-- Event is emited after client is 100% loded games
RegisterServerEvent("ft_gamemode:SvFirstJoinProper")
AddEventHandler('ft_gamemode:SvFirstJoinProper', function()

  local steamId = getSteamId(source)

  -- Add player in player table
  if not PlayerExist(source) then
    AddPlayer(steamId, source)
  end

  -- Send to player
  local player = GetPlayer(source)
  playerData = player.data
  playerData.steamId = nil
  playerData.createdAt = nil
  playerData.ban = nil
  playerData.whitelist = nil
  playerData.source = player.source

  -- Send to player client
  TriggerClientEvent("ft_gamemode:ClSetPlayerData", source, playerData)

  -- Send client ready
  TriggerClientEvent('ft_gamemode:ClReady', source)

end)

-- Recive chat message
AddEventHandler('chatMessage', function(source, n, message)

  -- Check if "/" is fist character
  if (firstString(message, "/")) then

    -- Get args commandes
    local commandArgs = stringSplit(message, " ")
    -- Get name commande
    local commandName = string.gsub(commandArgs[1], "/", "")
    -- Get command
    local command = Commands[commandName]
    -- Remove command name
    table.remove(commandArgs, 1)

    -- Check if command exite
    if command ~= nil then

      if command.permissionLevel ~= nil then

        local player = GetPlayer(source)
        if (player.Get("permissionLevel") >= command.permissionLevel) then
          command.callback(source, commandArgs)
        elseif (command.callbackFailed ~= nil and command.callbackFailed ~= '') then
          command.callbackfailed(source, commandName)
        else
          TriggerClientEvent('chatMessage', source, 'SYSTEM', {255, 0, 0}, Config.message.notPermissionLevel)
        end

      end

    end

    CancelEvent()
  end

end)
