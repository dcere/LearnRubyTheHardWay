class Sentence
   
   attr_reader :subject, :verb, :object
   
   def initialize(subject, verb, object)
      # Remember we take Pair.new(:noun, "princess") structs and convert them
      @subject = subject.word
      @verb = verb.word
      @object = object.word
   end
   
   # (Re)define an equal method so that we can compare two sentences based on
   # their actual contents.
   def ==(other_sentence)
      return (self.subject == other_sentence.subject and
              self.verb    == other_sentence.verb    and
              self.object  == other_sentence.object)
   end
   
end


class Parser

   # Needed for "return parse_subject(word_list, Pair.new(:noun, "player"))" line
   # in parse_sentence() function
   Pair = Struct.new(:token, :word)

   # The class ParserError is going to be used only inside Parser class, so let's
   # put it inside it.
   class ParserError < Exception
   end

   def peek(word_list)
      begin
         word_list.first.token
      rescue
         nil
      end
   end

   def match(word_list, expecting)
      begin
         word = word_list.shift
         if word.token == expecting
            word
         else
            nil
         end
      rescue
         nil
      end
   end

   def skip(word_list, token)
      while peek(word_list) == token
         match(word_list, token)
      end
   end

   def parse_verb(word_list)
      skip(word_list, :stop)
      
      if peek(word_list) == :verb
         return match(word_list, :verb)
      else
         raise ParserError.new("Expected a verb next.")
      end
   end

   def parse_object(word_list)
      skip(word_list, :stop)
      next_word = peek(word_list)
      
      if next_word == :noun
         return match(word_list, :noun)
      end
      if next_word == :direction
         return match(word_list, :direction)
      else
         raise ParserError.new("Expected a noun or a direction next.")
      end
   end

   def parse_subject(word_list, subj)
      verb = parse_verb(word_list)
      obj = parse_object(word_list)
      
      return Sentence.new(subj, verb, obj)
   end

   def parse_sentence(word_list)

      skip(word_list, :stop)
      
      start = peek(word_list)
      
      if start == :noun
         subj = match(word_list, :noun)
         return parse_subject(word_list, subj)
      elsif start == :verb
         # assume the subject is the player then
         return parse_subject(word_list, Pair.new(:noun, "player"))
      else
         raise ParserError.new("Must start with subject, object or verb not : #{start}")
      end
   end

end
