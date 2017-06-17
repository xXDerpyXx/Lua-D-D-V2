dofile("title.lua")
dofile("tableSave.lua")
math.randomseed(os.time())

--local ld = require("loadDirectory")
local class = require("class")
local loader = require("loader")
local mapping = require("map")
local player = require("player")
local inventory  = require("inventory")
local command = require("command")

menuInput = nil

function playerCreation()
	local stats = class.chooseClass()
	num = player.createPlayer(stats)
	inv = {}

	inventory.createInventory(inv,num)

	local stick = {
		["name"] = "basic stick",
		["amount"] = 1,
		["potency"] = 5,
		["attackType"] = "B",
		["attackMessage"] = "smack"
	}
	inventory.addItem(inv,stick)
	inventory.saveInventory(inv,num)
	stats["num"]=num
	player.savePlayer(stats,num)
	return stats
end

function loadGame()
	print("Pick a player!")
	allGames = loader.listGames()
	if #allGames == 0 then
		return false
	end

	for k,v in pairs(allGames) do
		local tempPlayer = player.loadPlayer(k)
		if tempPlayer ~= nil then
			if tempPlayer["class"] ~= nil then
				print(k.."   "..tempPlayer["name"].."   "..tempPlayer["class"])
			else
				print(k.."   "..tempPlayer["name"].."   CLASS NOT FOUND")
			end
		end
	end
	while allGames[tonumber(input)] == nil do
		io.write("Player:")
		input = io.read("*line")
	end
	return player.loadPlayer(tonumber(input))
end

function loadInv(num)
	return inventory.loadInventory(num)
end

function newLevel() --randomly pick a level?
	local levels = loader.listLevels()
	local level = levels[1]
	return level
end

function makeBasicMap() --make a basic map, nothing silly
	size = {}
	size["maxX"] = 10
	size["maxY"] = 10
	size["minX"] = -10
	size["minY"] = -10
	map = mapping.create(size)
	return map
end

while menuInput ~="5" do -- main loop!
	while menuInput ~= "1" and menuInput ~= "2" and menuInput ~= "5" do
		displayTitle()
		print("")
		print("1:LOAD GAME")
		print("2:NEW GAME")
		print("3:OPTIONS")
		print("4:SCOREBOARDS")
		print("5:QUIT")
		io.write(":")
		menuInput = io.read("*line")
		if menuInput == "3" then
			print("OPTIONS NOT IMPLIMENTED QUITE YET")
			menuInput = io.read("*line")
		end
		if menuInput == "2" then
			stats = playerCreation()
			print(stats["name"].." the "..stats["class"].." was created!")
		end
	end
	if menuInput == "1" then
		stats = loadGame()
		if stats == false then
			menuInput = nil
			print("Sorry!!! no players exist yet, make a new game!")
		else
			inv = inventory.loadInventory(stats["num"])
			print("Welcome back "..stats["name"].."!")
		end
	end
	if menuInput == "2" or menuInput == "1" then
		if stats["lastLevel"] == nil then
			level = newLevel()
			map = makeBasicMap()
			print("You have fallen into the "..level)
			stats["lastLevel"] = level
			stats["lastMap"] = map
			stats["x"] = 0
			stats["y"] = 0
		else
			local level = stats["lastLevel"]
			local map = stats["lastMap"]
			local exits = mapping.getExits(map,stats.x,stats.y)
		end
		player.savePlayer(stats,stats["num"])
		while true do -- main game loop!
			processCommand()
		end
	end
end
