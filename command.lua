local module = {}

local commands

-- COMMANDS --

function help()
  print("Commands: ")
  for i,v in pairs(commands) do
    print(i.." - "..v[1])
  end
end

function displayPlayer()
  print(stats["name"].."'s stats: ")
  print("Health: "..stats["hp"])
  print("Max Health: "..stats["maxh"])
  print("Class: "..stats["class"])
  print("Experience: "..stats["xp"])
  print("Level: "..stats["lvl"])
  print("Strength: "..stats["str"])
  print("Luck: "..stats["luck"])
  print("Sharp defense: "..stats["defs"])
  print("Blunt defense: "..stats["defb"])
  print("Magic defense: "..stats["defm"])
end

-- MAIN FUNCTIONS --

commands = {
  -- Format: ["Command name"] = {"Description of the command", Command function}
  ["help"] = {"Displays descriptions about each command", help},
  ["player"] = {"Displays your stats", displayPlayer}
}

function processCommand()
  io.write("What will you do? ")
  local cmd = io.read("*line")
  for i,v in pairs(commands) do
    if cmd:sub(1,i:len()) == i then
      io.write("\n")
      v[2](cmd:sub(i:len()+1))
    end
  end
end

return module
