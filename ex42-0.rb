class TheThing
   attr_reader :number

   @@total = 0

   def initialize()
      @number = 0
      @@total = @@total + 1
      puts "Initialized! total: #{@@total}"
   end

   def some_function()
      puts "I got called."
   end

   def add_me_up(more)
      @number += more
      return @number
   end
   
   def total()
      @@total
   end
end

# two different things
a = TheThing.new
b = TheThing.new

a.some_function()
b.some_function()

puts a.add_me_up(20)
puts a.add_me_up(20)
puts b.add_me_up(30)
puts b.add_me_up(30)

puts a.number
puts b.number

puts "We have a total of #{a.total} objects floating around"
