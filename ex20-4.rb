input_file = ARGV[0]

def print_all(f)
   puts f.read()
end

def rewind(f)
   # From http://www.ruby-doc.org/core-1.9.3/IO.html
   #
   # SEEK_SET  Beginning of file
   # SEEK_CUR  Current position of the file pointer
   # SEEK_END  End of file
   
   f.seek(0, IO::SEEK_SET)
end

def print_a_line(line_count, f)
   puts "#{line_count} #{f.readline()}"
end

current_file = File.open(input_file)

puts "First let's print the whole file:"
puts # a blank line

print_all(current_file)

puts "Now let's rewind, kind of like a tape."

rewind(current_file)

puts "Let's print three lines:"

current_line = 1
print_a_line(current_line, current_file)

current_line = current_line + 1
print_a_line(current_line, current_file)

current_line = current_line + 1
print_a_line(current_line, current_file)
