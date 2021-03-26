#!/usr/bin/ruby -w

def sum(numbers)
	i = 0
	out = 0
	while i < numbers.length
		if numbers[i].class != Integer && numbers[i].class != Float
			puts("fel input vid index: #{i}")
			return nil
		end
		out += numbers[i]
		i += 1
	end

	return out
end


def mean(numbers)
	if(!numbers.class == Array) then 
		puts("fel input")
		return
	end

	sumofnums = sum(numbers)

	return sumofnums / numbers.length
end

p mean([2, 2, 2, 2])
