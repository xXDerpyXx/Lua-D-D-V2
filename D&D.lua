dofile("title.lua")
dofile("tableSave.lua")
math.randomseed(os.time())

--local ld = require("loadDirectory")
local class = require("class")
local loader = require("loader")
local map = require("map")
local player = require("player")
local inventory  = require("inventory")
local command = require("command")

menuInput = nil

function playerCreation()
	local stats = class.chooseClass()
	num = player.createPlayer(stats)
	inv = {}
	inventory.createInventory(inv,num)
	stats["num"]=num
	player.savePlayer(stats,num)
	return stats
end

function loadGame()
	print("Pick a player!")
	allGames = loader.listGames()
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
	return inv.loadInventory(num)
end

function newLevel()
	local levels = loader.listLevels()
	local level = levels[1]
	return level
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
		inv = inventory.loadInv(stats["num"])
		print("Welcome back "..stats["name"].."!")
	end
	if menuInput == "2" or menuInput == "1" then
		if stats["lastLevel"] == nil then
			level = newLevel()
			size = {}
			size["maxX"] = 10
			size["maxY"] = 10
			size["minX"] = -10
			size["minY"] = -10
			map = map.create(size)
			print("You have fallen into the "..level)
			stats["lastLevel"] = level
			stats["lastMap"] = map 
		else
			local level = stats["lastLevel"]
			local map = stats["lastMap"]
		end
		player.savePlayer(stats,stats["num"])
		while true do -- main game loop!
			processCommand()
		end
	end
end
