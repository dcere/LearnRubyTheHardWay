# print doesn't add a new line automatically.
# puts adds a newline automatically.

print "How old are you? "
age = gets.chomp()
print "How tall are you? "
height = gets.chomp()
print "How much do you weigh? "
weight = gets.chomp()

puts "So, you are #{age} years old, #{height} tall and #{weight} heavy."
