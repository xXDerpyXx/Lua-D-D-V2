dofile("title.lua")
dofile("tableSave.lua")
math.randomseed(os.time())

--local ld = require("loadDirectory")
local loader = require("loader")
local map = require("map")

menuInput = nil

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
		
		end
	end
	if menuInput ~= "5" then
		while true do -- main game loop!
			
		end
	end
end
