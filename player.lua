local module = {}
local ld = require("loadDirectory")
dofile("tableSave.lua")

function module.getPlayers() -- Returns a list of all players
	return ld.loadDir("playerSaves")
end

function module.getStat(player,stat) -- Returns the value of a stat in the player
	if player == nil then
		print("ERROR: Player is nil!")
	end
	if player[stat] == nil then
		print("ERROR: Stat "..stat.." doesnt exist!")
		return nil
	end
	return player[stat]
end

function module.setStat(player,stat,val) -- Sets the stat in the player to a value
	if player[stat] == nil then
		print("ERROR: Stat "..stat.." doesnt exist!")
		return nil
	end
	player[stat] = val
	return player --new player table
end

function module.savePlayer(player, playerNum) -- Saves the player (a table) to a file
	local file = io.open("playerSaves/plr"..playerNum..".lua")
	if file == nil then
		print("ERROR: Save file plr"..playerNum..".lua doesnt exist!")
		return nil
	end
	table.save(player,"playerSaves/plr"..playerNum..".lua")
	return player
end

function module.loadPlayer(playerNum)
	local file = io.open("playerSaves/plr"..playerNum..".lua")
	if file == nil then
		print("ERROR: Save file plr"..playerNum..".lua doesnt exist!")
		return nil
	end
	local plr = table.load("playerSaves/plr"..playerNum..".lua")
	return plr
end

function module.createPlayer(player) -- Creates a player file and returns the number for it
	io.popen("mkdir playerSaves")
	for num=1,math.huge do
		local file = io.open("playerSaves/plr"..num..".lua")
		if file == nil then
			local file = io.open("playerSaves/plr"..num..".lua","w")
			return num
		end
	end
end

return module
