local loader = {}


function ls(dir)
  -- List all the files in a directory as a table.
  local results = {}
  for entry in io.popen('ls -1 ' .. dir):lines() do
    table.insert(results, entry)
  end
  return results
end


function loadEnemies(levelName)
  -- Loads the enemies into a table and returns that
end

function loadItems(levelName)
  -- Loads all the items from a level and returns a table of them.
end

function loader.listLevels()
  -- Returns a list of all the level names detected
  return ls("levels")
end

function loader.loadLevel(name)
  --[[ 
	Loads a level, returning a table like: {
	enemies = {table of enemies}
	items = {table of items
	}
	]]--

end


return loader
