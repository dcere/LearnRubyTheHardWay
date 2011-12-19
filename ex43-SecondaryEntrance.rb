require 'ex43-Death'

class SecondaryEntrance

   def initialize()
   end

   def main()
      puts "You arrive at the secondary entrance, but those chavs are starting"
      puts "to be really close. In such a terrifying moment you don't remember"
      puts "your access code. You know it should be easy for you because"
      puts "you are a forgetful person. And you know you are a freak."
      puts "Which one is your (4 digits) access code?"

      print ">"
      guess = gets.chomp()

      if guess == "1337"
         puts "The freak inside you remembered right."
         puts "You arrive to the lab and turn your computer on. You won!!"
         Process.exit(0)
      else
         puts "A horrific bzzzzz finds his way to your ears as the chavs catch"
         puts "you. They ask you for a cigarette and you say you don't have."
         puts "They beat you to death as you realize the look in their eyes"
         puts "hides a long term drug addiction. What are they doing here?"
         puts "They will never make it to the end of their major!! you think."
         puts "Well, neither will you"
         return Death.new()
      end
   end
end
