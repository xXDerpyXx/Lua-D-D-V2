local map = require "map"

math.randomseed(os.time())
size = {}
size["maxX"] = 10
size["maxY"] = 10
size["minX"] = -10
size["minY"] = -10

myMap = map.create(size)
map.display(myMap,10,10,10)

function setFG(r, g, b)
	local code = r*36 + g * 6 + b + 16
	io.write("\x1b[38;5;" .. code .. "m")
end

--Dungeon crawl!
function crawl()
	local x,y = 0,0
	local avoidTable = {
		["North"]="South",
		["South"]="North",
		["West"]="East",
		["East"]="West"
	}
	local lastChoice = ""
	for step=1,1000 do
		local exits = map.getExits(myMap, x,y)
		print("Possible exits from " .. tostring(x) .. "," .. tostring(y))
		local names = {}
		for dir, pos in pairs(exits) do
			print(dir)--, pos.x, pos.y)
			table.insert(names, dir)
		end

		local choice = names[math.random(#names)]
		for i = 1,40 do
		if choice == avoidTable[lastChoice] then
			 choice = names[math.random(#names)]
		end end
		lastChoice = choice

		ox, oy = x, y
		x = exits[choice].x
		y = exits[choice].y

		print("\x1b[2J")
		map.display(myMap,(ox+x)/2,(oy+y)/2,5)
		os.execute("sleep 0.1")

		print("\x1b[2J")
		map.display(myMap,x,y,5)
		os.execute("sleep 0.1")
	end
end

crawl()
