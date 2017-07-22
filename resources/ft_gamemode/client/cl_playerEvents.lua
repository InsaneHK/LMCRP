-- @Project: FiveM Tools
-- @License: GNU General Public License v3.0

AddEventHandler("playerSpawned", function()
  Citizen.CreateThread(function()

    local playerPed = GetPlayerPed(-1)

    if Config.pvp ~= nil and Config.pvp then
      NetworkSetFriendlyFireOption(true)
      SetCanAttackFriendly(playerPed, true, true)
    end

  end)
end)

AddEventHandler("ft_gamemode:ClFirstJoinProper", function()
  Citizen.CreateThread(function()

    while true do
      Citizen.Wait(0)

      local playerId = PlayerId()

      if Config.traffic ~= nil and Config.traffic >= 0.0 and Config.traffic <= 1.0 then
        if Config.traffic == 1.0 then
          Config.traffic = 0.9999999
        end
        SetVehicleDensityMultiplierThisFrame(Config.traffic)
      end

      if Config.pedDensity ~= nil and Config.pedDensity >= 0.0 and Config.pedDensity <= 1.0 then
        if Config.pedDensity == 1.0 then
          Config.pedDensity = 0.9999999
        end
        SetPedDensityMultiplierThisFrame(Config.pedDensity)
      end

      if Config.everyIgnores ~= nil and Config.everyIgnores then
        SetEveryoneIgnorePlayer(playerId, true)
      end

      if Config.policeIgnores ~= nil and Config.policeIgnores then
        SetPoliceIgnorePlayer(playerId, true)
        SetDispatchCopsForPlayer(playerId, false)
      end

      if Config.noWantedLevel ~= nil and Config.noWantedLevel then
        SetMaxWantedLevel(0)
      end

      if Config.vehicleRewards ~= nil and Config.vehicleRewards then
        DisablePlayerVehicleRewards(playerId)
      end

      if Config.pedScenario ~= nil and Config.pedScenario then
	     SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
      end

    end

  end)
end)
