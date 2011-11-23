# print doesn't add a new line automatically.
# puts adds a newline automatically.

print "How old are you? "
age = gets.chop()      # chop   != chomp
print "How tall are you? "
height = gets.chomp!() # chomp! != chomp
print "How much do you weigh? "
weight = gets.chop!()  # chop!  != chomp
print "What colour are your eyes? "
colour = gets.chomp    # without parentheses

puts "So, you are #{age} years old, #{height} tall and #{weight} heavy."
puts "And you have #{colour} eyes."
