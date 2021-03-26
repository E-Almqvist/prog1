#!/usr/bin/ruby -w

def get_indexes(str, char)
	i = 0
	index_array = []
	while i < str.length do
		if( str[i] == char ) then
			index_array << i
		end
		i += 1
	end

	return index_array
end

def split_char(str, char)
	# Tactic is to find all indexes of "char"
	indexes = get_indexes(str, char)
	output_array = []

	# Get the char AHEAD.
	# EXAMPLE:     aaaaEaaaaEaa
	#	       j---i

	# Do the first selection
	output_array << str[ 0 ... indexes[0] ]

	# Everything in the middle
	i = 1 # first one is is done on line 26
	while i < indexes.length do
		sel_i = indexes[i] # top border
		
		output_array << str[ (indexes[i-1] + 1) ... sel_i ]
		# indexes[i-1] + 1 
		# Selects the lower boundary and skips the selected char by 1 step. Example (L=lower boundary ; S = selected):
		# HEJ
		# LS

		i += 1
	end

	# The end
	output_array << str[ (indexes[-1] + 1) .. -1 ]

	return output_array
end

TEST_STRING = "THIS IS SEPERATED BY SPACES AND SPLIT WILL WORK! :D"
SEPERATOR = " "
word_array = split_char(TEST_STRING, SEPERATOR)

puts( "String: '#{TEST_STRING}'\nSeperator: '#{SEPERATOR}'" )
p word_array
