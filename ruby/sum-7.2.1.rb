#!/usr/bin/ruby -w

def sum(nums)
	out = 0
	for n in nums do 
		if(![Integer, Float].include?(n.class)) then
			puts("FELAKTIG INPUT :(")
			return 
		end
		out += n 
	end
	return out
end

p sum([1,2,3,4])
p sum([1, 2, 3, 4, "hej"])
