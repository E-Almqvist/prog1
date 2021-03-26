#!/usr/bin/ruby -w

# Desc: Function to append an item to a file-list 

# Param1: The path of the file
# Param2: Item string to be appended
# Return: nil 

def append_list(file_path, item)
	fh = File.open(file_path, "a+") 
	
	fh.puts(item)
	
	fh.rewind()
	puts fh.readlines() 

	fh.close()
end

