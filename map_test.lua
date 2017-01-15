local map = require "map"

math.randomseed(os.time())
size = {}
size["maxX"] = 20
size["maxY"] = 20
size["minX"] = -20
size["minY"] = -20

myMap = map.create(size)
map.display(myMap)
