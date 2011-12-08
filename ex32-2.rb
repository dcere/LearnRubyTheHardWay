the_count = [1, 2, 3, 4, 5]
fruits = ['apples', 'oranges', 'pears', 'apricots']
change = [1, 'pennies', 2, 'dimes', 3, 'quarters']

# this first kind of for-loop goes through an array
for number in the_count
   puts "This is count #{number}"
end

# same as abovem but usaing a block instead
fruits.each do |fruit|
   puts "A fruit of type: #{fruit}"
end

# also we can go through mixed arrays too
for i in change
   puts "I got #{i}"
end

# we can also bild arrays, first start with an empty one
elements = (0..5)

# now we can put them out too
for i in elements
   puts "Element was: #{i}"
end
