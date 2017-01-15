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

local x,y = 0,0
for step=1,20 do
	local exits = map.getExits(myMap, x,y)
	print("Possible exits from " .. tostring(x) .. "," .. tostring(y))
	local names = {}
  for dir, pos in pairs(exits) do
	  print(dir)--, pos.x, pos.y)
	  map.display(myMap,x,y,5)
		table.insert(names, dir)
  end
	local choice = names[math.random(#names)]
	x = exits[choice].x
	y = exits[choice].y
	print("Go " .. choice)
	print("")
end
