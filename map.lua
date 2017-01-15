math.randomseed(os.time())


function createMap(bounds)
	map = {}
	map[0] = {}
	map[0][0] = "O"
	local currentPosX = 0
	local currentPosY = 0
	for i = 1,50 do
		while true do --currentPosX + 1 and map[currentPosX + 1] and currentPosY
			if map[currentPosX] == nil then
				map[currentPosX] = {}
			elseif map[currentPosX + 1] == nil then
				map[currentPosX + 1] = {}
			elseif map[currentPosX - 1] == nil then
				map[currentPosX - 1] = {}
			end
			print(currentPosX+1)
			print(map[currentPosX+1])
			print(currentPosY)
			local rand = math.random(1,4)
			if rand == 4 then
				if currentPosX - 1 > bounds["minX"] then
					map[currentPosX - 1][currentPosY] = "O"
					currentPosX = currentPosX - 1
					break
				end
			end
			if rand == 3 then
				if currentPosX + 1 < bounds["maxX"] then
					map[currentPosX + 1][currentPosY] = "O"
					currentPosX = currentPosX + 1
					break
				end
			end
			if rand == 2 then
				if currentPosY + 1 < bounds["maxY"] then
					map[currentPosX][currentPosY + 1] = "O"
					currentPosY = currentPosY + 1
					break
				end
			end
			if rand == 1 then
				if currentPosY - 1 > bounds["minX"] then
					currentPosY = currentPosY - 1
					map[currentPosX][currentPosY - 1] = "O"
					break
				end
			end
		end
	end
	return map
end

function displayMap(map, bounds)
	for y=bounds["minY"],bounds["maxY"] do
		if map[x] == nil then
			io.write(" ")
		else
			for x=bounds["minX"],bounds["maxX"] do
				if map[x][y] == nil then
					io.write(" ")
				else
					io.write(map[x][y])
				end
			end
		end
		print("")
	end
end

size = {}
size["maxX"] = 15
size["maxY"] = 15
size["minX"] = -15
size["minY"] = -15
displayMap(createMap(size),size)
