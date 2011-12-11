def loop(limit)

   i = 0
   numbers = []

   while i < limit
      puts "At the top i is #{i}"
      numbers.push(i)
      
      i = i + 1
      puts "Numbers now: #{numbers}"
      puts "At the bottom i is #{i}"
   end
   
   puts "The numbers: "
   for num in numbers
      puts num
   end

end

loop(6)
puts "And now for something completely different: "
loop(7)
