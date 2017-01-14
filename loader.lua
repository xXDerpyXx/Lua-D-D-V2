local loader = {}

function ls(dir)
	-- List all the files in a directory as an array.
	local results = {}
	for entry in io.popen('ls -1 ' .. dir):lines() do
		table.insert(results, entry)
	end
	return results
end

function enemyFilename(level, enemy)
	return "levels/" .. level .. "/enemies/" .. enemy
end

function itemFilename(level, name)
	return "levels/" .. level .. "/items/" .. name
end

function loadEnemy(levelName, enemyName)
	return dofile(enemyFilename(levelName, enemyName))
end

function loadItem(levelName, itemName)
	return dofile(itemFilename(levelName, itemName))
end

function loadEnemies(levelName)
	-- Loads the enemies into a table and returns that
	local enemies = {}
	for _, name in pairs(ls("levels/" .. levelName .. "/enemies")) do
		table.insert(enemies, loadEnemy(levelName, name))
	end
	return enemies
end

function loadItems(levelName)
	-- Loads all the items from a level and returns a table of them.
end

function loader.listLevels()
	-- Returns a list of all the level names detected
	return ls("levels")
end

function loader.loadLevel(name)
	-- Loads a level, returning a table like: {
	-- enemies = {table of enemies}
	-- items = {table of items
	-- }
	local level = {name = name}
	level["enemies"] = loadEnemies(name)
	return level
end


return loader
