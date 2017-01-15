local map = require "map"

math.randomseed(os.time())
size = {}
size["maxX"] = 15
size["maxY"] = 15
size["minX"] = -15
size["minY"] = -15

myMap = map.create(size)
map.display(myMap)
