class Lexicon

   Pair = Struct.new(:token, :word)

   def initialize()
   
      # Define the type of words
      @directions = ["north", "south", "east", "west", "down", "up", "left", "right", "back"]
      @verbs = ["go", "stop", "kill", "eat"]
      @stop_words = ["the", "in", "of", "from", "at", "it"]
      @nouns = ["door", "bear", "princess", "cabinet"]

   end
   
   
   
   # is_smth? functions
   def is_direction?(word)
      return @directions.include?(word)
   end
   
   def is_verb?(word)
      return @verbs.include?(word)
   end
   
   def is_stop_word?(word)
      return @stop_words.include?(word)
   end
   
   def is_noun?(word)
      return @nouns.include?(word)
   end
   
   
   
   def scan(sentence)
   
      result = []
   
      words = sentence.chomp().split
      
      words.each do |word|

         # word always in downcase? No! Numbers and errors don't need it
         downcase = word.downcase()
         
         if is_direction?(downcase)
            result.push(Pair.new(:direction,downcase))
            
         elsif is_verb?(downcase)
            result.push(Pair.new(:verb,downcase))
         
         elsif is_stop_word?(downcase)
            result.push(Pair.new(:stop,downcase))
         
         elsif is_noun?(downcase)
            result.push(Pair.new(:noun,downcase))
         
         elsif convert_number(word)
            result.push(Pair.new(:number,Integer(word)))
         
         else
            result.push(Pair.new(:error,word))
         
         end
      end
      
      result
   
   end


   def convert_number(s)
      begin
         Integer(s)
      rescue ArgumentError
         nil
      end
   end

end
