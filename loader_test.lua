local loader = require "loader"
function dump(tbl, indent)
  local indent = indent or ""
  for k,v in pairs(tbl) do
    if type(v) == "table" then
      print(indent .. k)
      dump(v, indent .. "  ")
    else
      print(indent .. k .. "=" .. v)
    end
  end
end

print "Levels detected"
dump(loader.listLevels())

print "MEME_ZONE:"
dump(loader.loadLevel("MEME_ZONE"))
