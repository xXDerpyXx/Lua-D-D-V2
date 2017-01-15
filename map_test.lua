local map = require "map"

math.randomseed(os.time())
size = {}
size["maxX"] = 10
size["maxY"] = 10
size["minX"] = -10
size["minY"] = -10

myMap = map.create(size)
map.display(myMap)
