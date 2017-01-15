local clock = os.clock
function sleep(n)  -- seconds
  local t0 = clock()
  while clock() - t0 <= n do end
end
y=0
x=0
z=0
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
		io.write("O")
	else
		io.write("X")
	end
	for i = 1,math.abs(math.floor(math.sin(x)*10)*2) do
		if y%2 == 0 then
			io.write("-")
		else
			io.write(" ")
		end
	end
	if z == 1 then
		io.write("X")
	else
		io.write("0")
	end
	print(" ")
	sleep(0.012)
end
