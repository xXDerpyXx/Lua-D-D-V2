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
		return x, y + 1, x, y + 2
	end
	if rnd == 2 then
		return  x, y - 1, x, y - 2
	end
	if rnd == 3 then
		return x + 1, y,  x + 2, y
	end
	if rnd == 4 then
		return x - 1, y, x - 2, y
	end
	return x, y -- Shouldn't be possible? [its not possible]
end

function module.create(bounds)
	local map = {bounds = bounds}
	local currentPosY = 0
	local currentPosX = 0
	mapSet(map, 0, 0, "O")
	for i = 1,50 do
		-- Walk around (in bounds) until we find a non "O"
		local done = false
		while not done do
			local x1, y1, x2, y2 = randomWalk(currentPosX, currentPosY,map)
			if inBounds(bounds, x2, y2) then
				if mapGet(map, x2, y2) ~= "O" or math.random() < .02 then
					mapSet(map, x1, y1, x1==x2 and "|" or "=")
					mapSet(map, x2, y2, "O")
					done = true
					currentPosX, currentPosY = x2, y2
				end
			end
		end
	end
	local eX = currentPosX
	local eY = currentPosY
	mapSet(map, eX, eY, "E")
	mapSet(map, 0, 0, "X")
	return map
end

function module.display(map)
	local bounds = map.bounds
	for y=bounds["minY"],bounds["maxY"] do
	--os.execute("sleep .01") -- was for awesome points
		for x=bounds["minX"],bounds["maxX"] do
			local ch = mapGet(map, x, y) or " "
			io.write(ch)
		end
		io.write("\n")
	end
end

function module.travelTry(x,y,map)
	if map[x][y] == nil then
		return "BLOCKED"
	else
		return "FREE"
	end
	return "ERROR"
end

function module.getExits(map, x, y)
	local exits = {}
	function checkAndAdd(name, dx, dy)
		if mapGet(map, x + dx, y + dy) ~= nil then
			exits[name] = {
				x = x + dx * 2,
				y = y + dy * 2}
		end
	end
	checkAndAdd("North", 0, -1)
	checkAndAdd("South", 0, 1)
	checkAndAdd("West", -1, 0)
	checkAndAdd("East", 1, 0)
	return exits
end

return module
