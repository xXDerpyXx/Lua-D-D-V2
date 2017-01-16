local loader = {}

local ld = require("loadDirectory")

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
	for _, name in pairs(ld.loadDir("levels/" .. levelName .. "/enemies")) do
		table.insert(enemies, loadEnemy(levelName, name))
	end
	return enemies
end

function loadItems(levelName)
	-- Loads all the items from a level and returns a table of them.
	local items = {}
	for _, name in pairs(ld.loadDir("levels/" .. levelName .. "/items")) do
		table.insert(items, loadItem(levelName, name))
	end
	return items
end

function loader.listLevels()
	-- Returns a list of all the level names detected
	return ld.loadDir("levels")
end

function loader.loadLevel(name)
	-- Loads a level, returning a table like: {
	-- enemies = {table of enemies}
	-- items = {table of items
	-- }
	local level = {name = name}
	level["enemies"] = loadEnemies(name)
	level["items"] = loadItems(name)
	return level
end


return loader
