-- @Project: FiveM Tools
-- @License: GNU General Public License v3.0

Config = {

  name = "LMC RP", -- Server Name (optional)
  whitelist = true, -- Enable Whitelist (optional)
  pvp = true, -- Enable pvp (optional)
  everyIgnores = true, -- Everyone Ignores You (optional)
  policeIgnores = true, -- Police Ignores You (optional)
  noWantedLevel = true, -- Disable Wanted Level (optional)
  vehicleRewards = true, -- Disable Vehicle Rewards (optional)
  pedScenario = true, -- Disable Ped Scenario Like (Military/Police/Animal/Gang) (optional)
  traffic = 0.9, -- Vehicle traffic [0.0 - 1.0] (optional)
  pedDensity = 0.9, -- Ped Density [0.0 - 1.0] (optional)

  -- Custom message
  message = {
    noWhitelist = "Vous n'êtes pas Whitelist.",
    ban = "Vous êtes Banni de ce serveur !",
    notPermissionLevel = "Vous n'avez pas la permission d'executer cette commande.",
  },

}
