require 'open-uri'

open("http://www.ruby-lang.org/en") do |f|
  f.each_line {|line| p line}
  puts "Uri: #{f.base_uri}"
  puts "Content type: #{f.content_type}"
  puts "Charset: #{f.charset}"
  puts "Content encoding: #{f.content_encoding}"
  puts "Last modified: #{f.last_modified}"
end
