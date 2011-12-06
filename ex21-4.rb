def add(a, b)
   puts "ADDING #{a} + #{b}"
   a + b
end

def subtract(a, b)
   puts "SUBTRACTING #{a} - #{b}"
   a - b
end

def multiply(a, b)
   puts "MULTIPLYING #{a} * #{b}"
   a * b
end

def divide(a, b)
   puts "DIVIDING #{a} / #{b}"
   a / b
end

def square(a)
   puts "SQUARING #{a}"
   a * a
end

# Newton's law of universal gravitation
#
# F = G * ( (m1 * m2 ) / (r * r) )

G = 6.6674 * (10 ** -11)
m1 = 70
m2 = 50
r = 1
force = multiply(G,divide(multiply(m1,m2),square(r)))

puts "The force between #{m1} kgs and #{m2} kgs separated #{r} meters is #{force} Newtons"
