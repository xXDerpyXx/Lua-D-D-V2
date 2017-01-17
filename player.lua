local ld = require("loadDirectory")
dofile("tableSave.lua")

function getPlayers() -- Returns a list of all players
	return ld.loadDir("playerSaves")
end

function getStat(player,stat) -- Returns the value of a stat in the player
	if player[stat] == nil then
		print("ERROR: Stat "..stat.." doesnt exist!")
		return nil
	end
	return player[stat]
end

function setStat(player,stat,val) -- Sets the stat in the player to a value
	if player[stat] == nil then
		print("ERROR: Stat "..stat.." doesnt exist!")
		return nil
	end
	player[stat] = val
	return player --new player table
end

function savePlayer(player, playerNum) -- Saves the player (a table) to a file
	local file = io.open("playerSaves/plr"..playerNum..".lua")
	if file == nil then
		print("ERROR: Save file plr"..playerNum..".lua doesnt exist!")
		return nil
	end
	table.save(player,"playerSaves/plr"..playerNum..".lua")
	return player
end

function loadPlayer(playerNum)
	local file = io.open("playerSaves/plr"..playerNum..".lua")
	if file == nil then
		print("ERROR: Save file plr"..playerNum..".lua doesnt exist!")
		return nil
	end
	local plr = table.load("playerSaves/plr"..playerNum..".lua")
	return plr
end

function createPlayer(player) -- Creates a player file and returns the number for it
	for num=1,math.huge do
		local file = io.open("playerSaves/plr"..num..".lua")
		if file == nil then
			local file = io.open("playerSaves/plr"..num..".lua","w")
			return num
		end
	end
end
