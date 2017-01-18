dofile("title.lua")
dofile("tableSave.lua")
math.randomseed(os.time())

--local ld = require("loadDirectory")
local class = require("class")
local loader = require("loader")
local map = require("map")
local player = require("player")

menuInput = nil

function playerCreation()
	local stats = class.chooseClass()
	num = player.createPlayer(stats)
	player.savePlayer(stats,num)
	return stats
end

function loadGame()
	print("Pick a player!")
	allGames = loader.listGames()
	for k,v in pairs(allGames) do
		local tempPlayer = player.loadPlayer(k)
		print(k.."   "..tempPlayer["name"].."   "..tempPlayer["class"])
	end
	while allGames[tonumber(input)] == nil do
		io.write("Player:")
		input = io.read("*line")
	end
	return player.loadPlayer(tonumber(input))
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
		print("Welcome back "..stats["name"].."!")
	end
	if menuInput == "2" or menuInput == "1" then
		while true do -- main game loop!
			
		end
	end
end
