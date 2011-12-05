from_file, to_file = ARGV
script = $0

# we could do these two in one line too, how?
#input = File.open(from_file)
#indata = input.read()

indata = File.open(from_file).read()

output = File.open(to_file, 'w')
output.write(indata)

puts "Alright, all done."

output.close()
