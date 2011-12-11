def loop(limit, increment)

   i = 0
   numbers = []

   while i < limit
      puts "At the top i is #{i}"
      numbers.push(i)
      
      i = i + increment
      puts "Numbers now: #{numbers}"
      puts "At the bottom i is #{i}"
   end
   
   puts "The numbers: "
   for num in numbers
      puts num
   end

end

loop(6,2)

# This will "fail" :)
#loop(6,-1)
