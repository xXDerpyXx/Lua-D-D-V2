module = {}


function module.chooseClass()
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
		stats["defs"] = 5 --sharp defense
		stats["defb"] = 5 --blunt defense
		stats["defm"] = 5 --magic defense
		stats["dex"] = 5 --dexterity
		stats["str"] = 5 --strength
		stats["int"] = 5 --intelligence
		stats["spd"] = 5 --speed
		stats["luck"] = 5 --luck
		stats["xp"] = 0 --experience
		stats["lvl"] = 1 --level
		stats["maxh"] = 15 --maxHP
		stats["hp"] = 15 --HP
		stats["class"] = "rogue"
	end
	if string.lower(input) == "brute" then
		stats["defs"] = 7 --sharp defense
		stats["defb"] = 7 --blunt defense
		stats["defm"] = 3 --magic defense
		stats["dex"] = 3 --dexterity
		stats["str"] = 8 --strength
		stats["int"] = 3 --intelligence
		stats["spd"] = 3 --speed
		stats["luck"] = 5 --luck
		stats["xp"] = 0 --experience
		stats["lvl"] = 1 --level
		stats["maxh"] = 15 --maxHP
		stats["hp"] = 15 --HP
		stats["class"] = "brute"
	end
	if string.lower(input) == "mage" then
		stats["defs"] = 4 --sharp defense
		stats["defb"] = 4 --blunt defense
		stats["defm"] = 6 --magic defense
		stats["dex"] = 4 --dexterity
		stats["str"] = 3 --strength
		stats["int"] = 8 --intelligence
		stats["spd"] = 6 --speed
		stats["luck"] = 6 --luck
		stats["xp"] = 0 --experience
		stats["lvl"] = 1 --level
		stats["maxh"] = 15 --maxHP
		stats["hp"] = 15 --HP
		stats["class"] = "mage"
	end
	if string.lower(input) == "knight" then
		stats["defs"] = 6 --sharp defense
		stats["defb"] = 6 --blunt defense
		stats["defm"] = 6 --magic defense
		stats["dex"] = 8 --dexterity
		stats["str"] = 4 --strength
		stats["int"] = 3 --intelligence
		stats["spd"] = 4 --speed
		stats["luck"] = 6 --luck
		stats["xp"] = 0 --experience
		stats["lvl"] = 1 --level
		stats["maxh"] = 15 --maxHP
		stats["hp"] = 15 --HP
		stats["class"] = "knight"
	end
	
	
	return stats
end



return module
