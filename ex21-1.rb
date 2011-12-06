def fun1(a, b)
   a + b
end

def fun2(a, b)
   a + b
   2 + 3
end

def fun3(a, b)
   a + b
   "funfunfun3"
end

def fun4(a, b)
   a + b
   true
end

puts "Let's see the values returned from these functions"

value1 = fun1(20,3)
value2 = fun2(20,4)
value3 = fun3(20,5)
value4 = fun4(20,6)

puts "Fun1 returns: #{value1}"
puts "Fun2 returns: #{value2}"
puts "Fun3 returns: #{value3}"
puts "Fun4 returns: #{value4}"
