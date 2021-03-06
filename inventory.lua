local module = {}
local ld = require("loadDirectory")
dofile("tableSave.lua")


function module.createInventory(inv,num) -- Creates a inventory file and returns the number for it
	local file = io.open("playerSaves/inv"..num..".lua","w")
	return num
end

function module.getItem(inv,item) -- Returns the value of a stat in the inventory
	if inv == nil then
		print("ERROR: Inventory is nil!")
	end
	if inv[item] == nil then
		--print("ERROR: Item "..item.." doesnt exist!")
		return nil
	end
	return inv[item]
end

function module.setItem(inv,item,amount) -- Sets the item in the inventory to a value
	if inv[item] == nil then
		inv[item] = item
	end
	if inv[item]["amount"] == nil then
		inv[item]["amount"] = 1
	end
	if inv[item] ~= nil then
		inv[item]["amount"] = inv[item]["amount"]+amount
	end

	return inv --new inventory table
end

function module.saveInventory(inv, playerNum) -- Saves the inventory (a table) to a file
	local file = io.open("playerSaves/inv"..playerNum..".lua")
	if file == nil then
		print("ERROR: Save file inv"..playerNum..".lua doesnt exist!")
		return nil
	end
	table.save(inv,"playerSaves/inv"..playerNum..".lua")
	return inv
end


function module.loadInventory(playerNum)
	local file = io.open("playerSaves/plr"..playerNum..".lua")
	if file == nil then
		print("ERROR: Save file plr"..playerNum..".lua doesnt exist!")
		return nil
	end
	local inv = table.load("playerSaves/inv"..playerNum..".lua")
	return inv
end

function module.addItem(inv,item)
	for i=1,math.huge do
		if inv[i] == nil then
			table.insert(inv,i,item)
			break
		end
	end
end


return module
