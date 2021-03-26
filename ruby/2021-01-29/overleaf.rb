#!/usr/bin/ruby -w

def validate_array(arr, allowed_classes)
	for elem in arr do
		if(!allowed_classes.include?(elem.class)) then
			return false
		end
	end

	return true
end


# 7.2.2
def average(arr)
	if( !validate_array(arr, [Integer, Float]) ) then raise "Input error, elements in array are not \"numbers\"." end

	return arr.sum / arr.length
end

# 7.3.2
def filter(arr, val)
	val_count = arr.count(val)
	return Array.new(val_count, val)
end
