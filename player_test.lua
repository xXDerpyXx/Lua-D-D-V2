dofile("player.lua")

local plrStats = {
  health = 14,
  memes = {"bee movie","the lorax"},
  name = "Robert R. Rotten"
}

plr = createPlayer()
savePlayer(plrStats,plr)
print(getStat(plrStats,"health"))
setStat(plrStats,"name","Sportaflop") -- memes
savePlayer(plrStats,plr)
print(table.concat(getPlayers(),","))
local plr2 = loadPlayer(2)
print(getStat(plr2,"name"))
loadPlayer(59)
