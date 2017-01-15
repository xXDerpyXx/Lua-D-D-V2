local module = {}

local function mapSet(map, x, y, value)
	if map[x] == nil then map[x] = {} end
	map[x][y] = value
end

local function mapGet(map, x, y)
	if map[x] == nil then
		return nil
	end
	return map[x][y]
end

local function inBounds(bounds, x, y)
	if x < bounds["minX"] then return false end
	if x > bounds["maxX"] then return false end
	if y < bounds["minY"] then return false end
	if y > bounds["maxY"] then return false end
	return true
end

local function randomWalk(x, y,map)
	while true do
		local rnd = math.random(1, 4)
		if rnd == 1 and not mapGet(map,x,y+2) =="O" then
			return x, y + 2
		end
		if rnd == 2 and not mapGet(map,x,y-2) =="O" then
			return x, y - 2
		end
		if rnd == 3 and not mapGet(map,x+2,y) =="O" then
			return x + 2, y
		end
		if rnd == 4 and not mapGet(map,x-2,y) =="O" then
			return x - 2, y
		end
	end
	return x, y -- Shouldn't be possible? [its not possible]
end

function module.create(bounds)
	local map = {bounds = bounds}
	local currentPosY = 0
	local currentPosX = 0
	for i = 1,2 do
		-- Walk around (in bounds) until we find a non "O"
		while mapGet(map, currentPosX, currentPosY) == "O" do
			local nextX, nextY = randomWalk(currentPosX, currentPosY,map)
			if inBounds(bounds, nextX, nextY) then
				currentPosX = nextX
				currentPosY = nextY
			end
		end
		mapSet(map, currentPosX, currentPosY, "O")
	end
	return map
end

function module.display(map)
	local bounds = map.bounds
	for y=bounds["minY"],bounds["maxY"] do
		for x=bounds["minX"],bounds["maxX"] do
			local ch = mapGet(map, x, y) or " "
			io.write(ch)
		end
		io.write("\n")
	end
end

return module
