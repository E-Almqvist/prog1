#!/usr/bin/ruby -w

def read_book(file_path)
	if(!File.file?(file_path)) then raise "Error opening file '#{file_path}'." end

	fh = File.open(file_path)
	content = fh.read()
	fh.close()

	return content
end

def read_book_lines(file_path)
	content = read_book(file_path).split("\n")	

	return content
end

def read_book_words(file_path)
	content = read_book(file_path).gsub(/([\/n]|[\/r])/, "").split(" ")
	return content
end

def count_lines(file_path) 
	content = read_book_lines(file_path)

	return content.length
end

def count_words(file_path)
	content = read_book_words(file_path)

	return content.length
end

def count_word(file_path, word)
	content = read_book_words(file_path)
	
	return content.count(word)
end


def help()
	puts("1: count lines\n2: count words\n3: count word\nh: help\nq: exit")
end

def menu(file_path)
	help()	

	while true do
		print("> ")
		usr_inp = gets().chomp()
		
		if( usr_inp == "q" ) then
			exit(0)
		elsif( usr_inp == "h" ) then
			help()
		elsif( usr_inp == "1" ) then
			puts( count_lines(file_path) )
		elsif( usr_inp == "2" ) then
			puts( count_words(file_path) )
		elsif( usr_inp == "3" ) then
			print("Word: ")
			word = gets().chomp()

			puts( count_word(file_path, word) )
		else
			puts("Invalid command.")
		end
	end
end


print("File: ")
file = gets().chomp()
menu(file)
