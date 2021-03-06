local ld = require("loadDirectory")

local clock = os.clock
function sleep(n)  -- seconds
  local t0 = clock()
  while clock() - t0 <= n do end
end
y=0
x=0
z=0

if ld.autoDetect() == "Linux" then
	linux = true
end

linux = true

function setFG(r, g, b)
	local code = r*36 + g * 6 + b + 16
	io.write("\x1b[38;5;" .. code .. "m")
end


for i = 1,240 do
	x=x+.1
	y=y+1
	if math.floor(math.sin(x)*10) == 0 then
		if z == 1 then
			z = 0
		else
			z = 1
		end
	end
	for i = 1,(math.abs(math.floor(math.sin(x)*10))*-1 )+15 do
		io.write(" ")
	end
	if z == 1 then
		if linux then
			setFG(5,0,0)
		end
		io.write("O")
	else
		if linux then
			setFG(0,0,5)
		end
		io.write("X")
	end
	for i = 1,math.abs(math.floor(math.sin(x)*10)*2) do
		if linux then
			setFG(5,0,5)
		end
		if y%2 == 0 then
			io.write("-")
		else
			io.write(" ")
		end
	end
	if z == 1 then
		if linux then
			setFG(0,0,5)
		end
		io.write("X")
	else
		if linux then
			setFG(5,0,0)
		end
		io.write("0")
	end
	print(" ")
	sleep(0.010)
end
