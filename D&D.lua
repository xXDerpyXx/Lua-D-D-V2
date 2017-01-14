
dofile("tableSave.lua")
math.randomseed(os.time())

function ls(dir)
  local results = {}
  for entry in io.popen('ls -1 ' .. dir):lines() do
    table.insert(results, entry)
  end
  return results
end

function load()
  -- read all the levels
  print("LOADING CONTENT")
  levels = ls("levels")
  levelEnemies = {}
  enemyNums = {}
  levelItems={}
  levelCount=0
  for _,level in ipairs(levels) do
	levelCount=levelCount+1
    levelEnemies[level] = {}
    levelItems[level] = {}
      -- for each level, read the enemies
      tempNum = 1
    for _,enemy in ipairs(ls("levels/" .. level .. "/enemies")) do
      table.insert(levelEnemies[level], enemy)
    end
    for _,item in ipairs(ls("levels/" .. level .. "/items")) do
      table.insert(levelItems[level], item)
    end
  end

  -- Print out what we loaded
	for _,level in ipairs(levels) do
		print(level..":")
		print("   Enemies:")
		for _,enemy in ipairs(levelEnemies[level]) do
			print("     " .. enemy)
		end
		print("   Items:")
		for _,item in ipairs(levelItems[level]) do
			print("     " .. item)
		end
	end
end





while true do -- main loop!
	load()
	while true do -- main game loop!
		
	end
end

