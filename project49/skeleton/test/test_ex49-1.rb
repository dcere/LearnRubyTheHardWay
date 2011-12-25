require 'test/unit'
require '../lib/ex49-1'
require '../../../project48/skeleton/lib/lexicon-4.rb'

class Ex49_1Tests < Test::Unit::TestCase

   Pair = Lexicon::Pair
   ParserError = Parser::ParserError
   @@parser = Parser.new()
   
   def test_peek()
      assert_equal(@@parser.peek([ Pair.new(:noun, 'bear'), Pair.new(:verb, 'eat') ]), :noun)
      
      # We are looking for the token of the first word. Just the token.
      assert_equal(@@parser.peek([ Pair.new(:verb, 'bear'), Pair.new(:noun, 'eat') ]), :verb)
   end
   
   def test_match()
      assert_equal(@@parser.match( [ Pair.new(:noun, 'bear'), Pair.new(:verb, 'eat') ], :noun),
                   Pair.new(:noun, 'bear') )
      assert_equal(@@parser.match( [ Pair.new(:verb, 'eat'), Pair.new(:noun, 'bear') ], :verb),
                   Pair.new(:verb, 'eat') )
   end

   def test_skip()
      assert_equal(@@parser.skip( [ Pair.new(:noun, 'bear'), Pair.new(:verb, 'eat') ], :stop),
                   nil )
   end
   
   def test_parse_verb()
      assert_equal(@@parser.parse_verb([ Pair.new(:verb, 'eat'), Pair.new(:noun, 'bear') ]),
                   Pair.new(:verb, 'eat') )
                   
      # While parsing a verb receiving a noun should cause an Exception to be raised.
      assert_raise( ParserError ) { @@parser.parse_verb([Pair.new(:noun, 'bear')]) }
   end
   
   def test_parse_object()
      assert_equal(@@parser.parse_object([ Pair.new(:noun, 'bear'), Pair.new(:verb, 'eat') ]),
                   Pair.new(:noun, 'bear') )
                   
      # While parsing an object receiving a verb should cause an Exception to be raised.
      assert_raise( ParserError ) { @@parser.parse_object([Pair.new(:verb, 'eat')]) }
   end
   
   def test_parse_subject()
      # Princess eat bear
      result1 = @@parser.parse_subject([ Pair.new(:verb, 'eat'), Pair.new(:noun, 'bear') ],
                                       Pair.new(:noun, 'princess'))
      
      result2 = Sentence.new(Pair.new(:noun, 'princess'),Pair.new(:verb, 'eat'),
                             Pair.new(:noun, 'bear'))
      
      # No longer fails!!
      assert_equal(result1,result2)
   end

   def test_parse_sentence()
      # Princess eat bear
      result1 = @@parser.parse_sentence([Pair.new(:noun, 'princess'),
                                         Pair.new(:verb, 'eat'),
                                         Pair.new(:noun, 'bear')])
      result2 = Sentence.new(Pair.new(:noun, 'princess'),
                             Pair.new(:verb, 'eat'),
                             Pair.new(:noun, 'bear'))
                             
      # No longer fails!!
      assert_equal(result1,result2)
      
      # A subject + a verb is not a sentence (in this grammar)
      # If no subject is found it defaults to 'player' so you will get the
      # exception while trying to find the object. The exception will be raised
      # in parse_object and not in parse_sentence.
      assert_raise( ParserError ) { @@parser.parse_sentence([Pair.new(:verb, 'eat')]) }
      
      # A sentence starting with a direction is not a sentence
      assert_raise( ParserError ) { @@parser.parse_sentence([Pair.new(:direction, 'north')]) }
   end
end
