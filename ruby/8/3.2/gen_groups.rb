#!/usr/bin/ruby -w

def get_names(file_path)
	if(!File.file?(file_path)) then raise "Error opening file '#{file_path}'." end

	fh = File.open(file_path, "r")
	content = fh.read()
	names = content.split("\r\n")
	fh.close()

	return names
end

def randomize_names(names)
	new_names = names.dup()
	new_names = new_names.shuffle()
	return new_names 
end

def group_names(names, group_size)
	groups = []

	index_rng = 0
	
	while index_rng < names.length do
		groups << names[index_rng...(index_rng + group_size)] 
		index_rng += group_size
	end

	return groups
end

def write_groups_file(file_path, groups)
	fh = File.open(file_path, "w")

	group_id = 0

	while group_id < groups.length do
		fh.puts("Group #{group_id+1}:")
		fh.puts(groups[group_id])
		fh.puts("\n")
		group_id += 1
	end

	fh.close()
end

File_path 	=		ARGV[0] 		|| "names.txt"
Out_path 	= 		ARGV[1] 		|| "groups.txt"
Group_size 	= 		ARGV[2].to_i 	|| 4

Names = get_names(File_path)
rand_names = randomize_names(Names)
groups = group_names(rand_names, Group_size)

puts("Writing groups to '#{Out_path}'...")
write_groups_file(Out_path, groups)
puts("Done.")
