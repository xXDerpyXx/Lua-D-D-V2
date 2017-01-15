local map = require "map"

math.randomseed(os.time())
size = {}
size["maxX"] = 10
size["maxY"] = 10
size["minX"] = -10
size["minY"] = -10

myMap = map.create(size)
map.display(myMap,10,10,10)


print "A little bit of path"

--Dungeon crawl!
function crawl(pace)
	local x,y = 0,0
	for step=1,100 do
		local exits = map.getExits(myMap, x,y)
		print("Possible exits from " .. tostring(x) .. "," .. tostring(y))
		local names = {}
	  for dir, pos in pairs(exits) do
		  print(dir)--, pos.x, pos.y)
			table.insert(names, dir)
	  end
		local choice = names[math.random(#names)]
		x = exits[choice].x
		y = exits[choice].y
		print("Go " .. choice)
		print("")
		map.display(myMap,x,y,5)
		print("")
		if pace~=0 and pace ~= nil then
			os.execute("sleep 0.1")
		end
	end
end

crawl()
