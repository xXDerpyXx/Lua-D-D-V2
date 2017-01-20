local module = {}
local ld = require("loadDirectory")
dofile("tableSave.lua")


function module.createInventory(inv) -- Creates a inventory file and returns the number for it
	for num=1,math.huge do
		local file = io.open("playerSaves/inv"..num..".lua")
		if file == nil then
			local file = io.open("playerSaves/inv"..num..".lua","w")
			return num
		end
	end
end

function module.getItem(inv,item) -- Returns the value of a stat in the player
	if inv == nil then
		print("ERROR: Inventory is nil!")
	end
	if inv[item] == nil then
		print("ERROR: Item "..item.." doesnt exist!")
		return nil
	end
	return inv[item]
end

function module.setItem(inv,item,amount) -- Sets the stat in the player to a value
	if inv[item] == nil then
		inv[item]["amount"] = inv[item]["amount"]+amount
	end
	inv[item] = item
	return inv --new player table
end

function module.saveInventory(inv, playerNum) -- Saves the player (a table) to a file
	local file = io.open("playerSaves/inv"..playerNum..".lua")
	if file == nil then
		print("ERROR: Save file inv"..playerNum..".lua doesnt exist!")
		return nil
	end
	table.save(player,"playerSaves/inv"..playerNum..".lua")
	return inv
end





return module
