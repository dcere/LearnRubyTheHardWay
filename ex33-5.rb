def loop(limit)

   i = 0
   numbers = []

   for i in (0..limit-1) # limit - 1 to have the same behaviour than before
      puts "At the top i is #{i}"
      numbers.push(i)
      
      puts "Numbers now: #{numbers}"
      puts "At the bottom i is #{i}"
   end
   
   puts "The numbers: "
   for num in numbers
      puts num
   end

end

loop(6)
