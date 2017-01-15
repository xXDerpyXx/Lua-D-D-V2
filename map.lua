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

local function randomWalk(x, y)
	local rnd = math.random(1, 4)
	if rnd == 1 then
		return x, y + 1
	elseif rnd == 2 then
		return x, y - 1
	elseif rnd == 3 then
		return x + 1, y
	elseif rnd == 4 then
		return x - 1, y
	end
	return x, y -- Shouldn't be possible?
end

function module.create(bounds)
	local map = {bounds = bounds}
	local currentPosY = 0
	local currentPosX = 0
	for i = 1,50 do
		-- Walk around (in bounds) until we find a non "O"
		while mapGet(map, currentPosX, currentPosY) == "O" do
			local nextX, nextY = randomWalk(currentPosX, currentPosY)
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
