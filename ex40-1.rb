map =
{
   'Andalucia' => ['Sevilla'],
   'Aragon'    => ['Zaragoza'],
   'Cataluña'  => ['Barcelona'],
   'Madrid'    => ['Madrid']
}
   

def add_region(region,map)
   if map.include?(region)
      puts "Region #{region} already exists"
   else
      map[region] = []
   end
end


def add_city(city,region,map)
   if map.include?(region)
      map[region].push(city)
   else
      puts "Region #{region} does not exist"
   end
end


def find_city(city, map)
   found = false
   map.each {|region,cities|
      if cities.include?(city)
         puts "#{city} is in #{region}"
         found = true
      end
      break if found
   }
   unless found
      puts "#{city} was not found"
   end
end


def print_region(region,map)
   if map.include?(region)
      for city in map[region]
         print "#{city} "
      end
      puts ""
   else
      puts "Region #{region} does not exist"
   end
end


def print_map(map)
   map.each do |region,cities|
      puts "#{region}"
      print_region(region,map)
      puts ""
   end
end


while true
   puts ""
   puts "Spain map"
   puts "---------"
   puts "1. Add region"
   puts "2. Add city"
   puts "3. Find city"
   puts "4. Print region"
   puts "5. Print map"
   print "Option? (ENTER to quit): "
   option = gets.chomp()
   
   break if option.empty?
   
   case option
      when "1"
         print "Region?: "
         region = gets.chomp()
         add_region(region,map)
      when "2"
         print "City?: "
         city = gets.chomp()
         print "Region?: "
         region = gets.chomp()
         add_city(city,region,map)
      when "3"
         print "City?: "
         city = gets.chomp()
         find_city(city,map)
      when "4"
         print "Region?: "
         region = gets.chomp()
         print_region(region,map)
      when "5"
         print_map(map)
   end
   
end
