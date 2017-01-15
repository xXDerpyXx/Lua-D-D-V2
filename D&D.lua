dofile("title.lua")
dofile("tableSave.lua")
math.randomseed(os.time())

function ls(dir)
	local results = {}
	for entry in io.popen('ls -1 ' .. dir):lines() do
		table.insert(results, entry)
	end
	return results
end

displayTitle()

while true do -- main loop!
	while true do -- main game loop!
		
	end
end

