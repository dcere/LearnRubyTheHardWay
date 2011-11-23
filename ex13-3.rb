puts "These are all you arguments: "
ARGV.each do |a|
  puts "Argument: #{a}"
end

puts ""
print "If you left something, you can say it now: "
more = STDIN.gets.chomp()
puts "Ok, got it. You said #{more}."
