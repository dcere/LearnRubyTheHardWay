filename = ARGV.first

prompt = "> "
txt = File.open(filename)

puts "Here is your file: #{filename}"
puts txt.read()
txt.close()

puts "Type the filename again:"
print prompt
file_again = STDIN.gets.chomp()

txt_again = File.open(file_again)

puts txt_again.read()
txt_again.close()

# If you use file with blocks the file is closed automatically after you
# finish working in that block:
#
# File.open('foo', 'w') do |f|
#    f.write "bar"
# end
