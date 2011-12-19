require 'ex43-MainEntrance'
require 'ex43-SecondaryEntrance'

class BusStop

   def initialize()
   end

   def main()
      puts "You arrive on the 23 bus to the bus stop. All the freshmans get off"
      puts "the bus before you. The 'seafront' is narrow so they look like a"
      puts "cattle going to the slaughter house. You wonder if shouting"
      puts "'Baaaaaaa' will make the situation funnier"
      puts "Do you shout?"

      print ">"
      guess = gets.chomp()

      if guess == "yes" or guess == "y"
         puts "You fill your lungs and shout the loudest 'Baaaaaaaaa' the Earth"
         puts "has ever heard. Unfortunately they are not in good mood and the"
         puts "joke is not funny for them. The chavs among the freshmans are"
         puts "trying to hurt you with their looks and you know this will only"
         puts "lead to trying to hurt you with their fists."
         puts "Fortunately you are in good shape and you can make it to the"
         puts "secondary entrance"
         return SecondaryEntrance.new()
      elsif guess == "no" or guess == "n"
         puts "The coward (or educated) human being inside you decides not to"
         puts "shout and you politely join the cattle. But the cattle farts all"
         puts "the way to the entrance so you get there, but severely intoxicated."
         return MainEntrance.new()
      else
         initialize()
      end
   end
end
