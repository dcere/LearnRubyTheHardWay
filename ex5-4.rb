name = 'Zed A. Shaw'
age = 35 #not a lie according to him

height = 74 #inches
is_height = height * 2.54 # international system height (cms)

weight = 180 #lbs
is_weight = weight * 0.45359237 # international system weight (kilos)

eyes = 'Blue'
teeth = 'White'
hair = 'Brown'

puts "Let's talk about %s." % name
puts "He's %d inches (%d cms) tall." % [height, is_height]
puts "He's %d pounds (%d kilos) heavy." % [weight, is_weight]
puts "Actually that's not too heavy."
puts "He's got %s eyes and %s hair." % [eyes,hair]
puts "His teeth are usually %s depending on the coffee." % teeth

# this line is tricky, try to get it exactly right
puts "If I add %d, %d, and %d I get %d." %
     [age, height, weight, age + height + weight]
