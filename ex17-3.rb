#from_file, to_file = ARGV

File.open(ARGV[1], 'w').write(File.open(ARGV[0]).read())
puts "Alright, all done."
