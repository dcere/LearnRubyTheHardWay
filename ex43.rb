require 'ex43-BusStop'
require 'ex43-MainEntrance'
require 'ex43-SecondaryEntrance'
require 'ex43-Death'

class Engine

   def initialize()
   end
   
   def play()
      
      room = BusStop.new()
   
      while true
         room = room.main()
      end
   end
end

game = Engine.new()
game.play()
