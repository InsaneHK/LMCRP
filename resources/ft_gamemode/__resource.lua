-- @Project: FiveM Tools
-- @License: GNU General Public License v3.0

resource_type "gametype" { name = "LMC RP v2.0" }

resource_manifest_version "77731fab-63ca-442c-a67b-abc70f28dfa5"

client_scripts {

  "configurations.lua", -- Configuration file
  "client/cl_init.lua", -- Init Client
  "client/cl_player.lua", -- Player
  "gameplay/scoreboard.lua",
  "gameplay/map.lua",
  "gameplay/carhud.lua",
  "gameplay/missiontext.lua",
  "gameplay/nowanted.lua",

}

server_scripts {

  "configurations.lua", -- Configuration file
  "server/sv_utils.lua", -- Utils
  "server/sv_player.lua", -- Player manager
  "server/sv_players.lua", -- Players managers
  "server/sv_commands.lua", -- Commands mananagers
  "server/sv_init.lua", -- Init Server

}

exports {

  "SetPlayerData",
  "GetPlayerData",

}

server_script '@mysql-async/lib/MySQL.lua'
