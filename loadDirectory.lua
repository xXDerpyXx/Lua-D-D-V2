local module = {}

local HostOS = "linux"

function module.getOS()
  return HostOS
end

function module.changeOS(OS)
  -- Change the method this script will use to list a directory
  if string.lower(OS) == ("windows" or "win") then
    HostOS = "windows"
  elseif string.lower(OS) == "linux" then
    HostOS = "linux"
  end
end

function module.loadDir(dir)
  -- List all the files in a directory as an array.
  local results = {}
  if HostOS == "windows" then
    method = 'dir "' .. dir .. '" /b /ad'
  else
    method = 'ls  -1 ' .. dir
  end
  for entry in io.popen(method):lines() do
    table.insert(results, entry)
  end
  return results
end

return module
