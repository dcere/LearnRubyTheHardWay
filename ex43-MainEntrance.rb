require 'ex43-Death'

class MainEntrance

   def initialize()
   end

   def main()
      puts "With great effort you cross the chicane the main door forms only to"
      puts "realize that a bigger problem has arosen: the receptionist."
      puts "If he sees you, you are a dead man so you have to think fast."
      puts "Do you \e[1mhide\e[0m inside a cleaning trolley or do you \e[1mcrawl\e[0m?"

      print ">"
      guess = gets.chomp()

      if guess == "hide"
         puts "You hide inside the trolley and you finally get moved."
         puts "You arrive to the lab and turn your computer on. You won!!"
         Process.exit(0)
      elsif guess == "crawl"
         puts "As you are crawling the receptionist decides to go out for a coffe."
         puts "Oh man, you should really know they are always going out for a coffe!"
         puts "He sees you and kills you with no mercy. After all it seems that"
         puts "you won't get the major in computer science. At least not in this"
         puts "life"
         return Death.new()
      else
         puts "Invalid answer!!"
         return main()
      end
   end
end
