dofile("title.lua")
dofile("tableSave.lua")
math.randomseed(os.time())

--local ld = require("loadDirectory")
local loader = require("loader")
local map = require("map")
local player = require("player")

menuInput = nil

function playerCreation()
	local stats = {}
	io.write("Name:")
	input = io.read("*line")
	stats["name"] = input
	print("")
	print("Pick a class")
	print("Rogue -- Very rounded, though not particularly good at much.")
	print("Brute -- Strong as an Ox, though, also dumb as one.")
	print("Mage -- Smart and good at sorcery, but weak and cowardly.")
	print("Knight -- Strong, brave, bold! but not the brightest or fastest.")
	print("")
	io.write(":")
	input = io.read("*line")
	if string.lower(input) == "rogue" then
		player["defs"] = 5 --sharp defense
		player["defb"] = 5 --blunt defense
		player["defm"] = 5 --magic defense
		player["dex"] = 5 --dexterity
		player["str"] = 5 --strength
		player["int"] = 5 --intelligence
		player["spd"] = 5 --speed
		player["luk"] = 5 --luck
		player["xp"] = 0 --experience
		player["lvl"] = 1 --level
		player["mhp"] = 15 --maxHP
		player["hp"] = 15 --HP
	end
	num = player.createPlayer(stats)
	player.savePlayer(stats,num)
	return stats
end

function loadGame()
	print("Pick a player!")
	allGames = loader.listGames()
	for k,v in pairs(allGames) do
		local tempPlayer = player.loadPlayer(k)
		print(k.."   "..tempPlayer["name"])
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
		end
	end
	if menuInput == "1" then
		stats = loadGame()
	end
	if menuInput == "2" or menuInput == "1" then
		while true do -- main game loop!
			
		end
	end
end
