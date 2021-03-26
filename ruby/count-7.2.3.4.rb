#!/usr/bin/ruby -w


def count(arr, elem)
	# söker efter "elem" i "arr"
	i = 0
	out = 0
	while i < arr.length do
		if(arr[i] == elem) then
			out += 1
		end
		i += 1
	end

	return out
end

p count(["ahufid", "a", 1, 2, 3, 4, 2, 2, 2, 2], 2)
