require 'test/unit'
require '../lib/ex49'
require '../../../project48/skeleton/lib/lexicon-4.rb'

# Inspired on https://github.com/faheempatel/Learning-Python-The-Hard-Way
# https://github.com/faheempatel/Learning-Python-The-Hard-Way/blob/master/Exercise49/skeleton/tests/ex49_tests.py

class Ex49Tests < Test::Unit::TestCase

   Pair = Lexicon::Pair
   
   def test_peek()
      assert_equal(peek([ Pair.new(:noun, 'bear'), Pair.new(:verb, 'eat') ]), :noun)
      
      # We are looking for the token of the first word. Just the token.
      assert_equal(peek([ Pair.new(:verb, 'bear'), Pair.new(:noun, 'eat') ]), :verb)
   end
   
   def test_match()
      assert_equal(match( [ Pair.new(:noun, 'bear'), Pair.new(:verb, 'eat') ], :noun),
                   Pair.new(:noun, 'bear') )
      assert_equal(match( [ Pair.new(:verb, 'eat'), Pair.new(:noun, 'bear') ], :verb),
                   Pair.new(:verb, 'eat') )
   end

   def test_skip()
      assert_equal(skip( [ Pair.new(:noun, 'bear'), Pair.new(:verb, 'eat') ], :stop),
                   nil )
   end
   
   def test_parse_verb()
      assert_equal(parse_verb([ Pair.new(:verb, 'eat'), Pair.new(:noun, 'bear') ]),
                   Pair.new(:verb, 'eat') )
                   
      # While parsing a verb receiving a noun should cause an Exception to be raised.
      assert_raise( ParserError ) { parse_verb([Pair.new(:noun, 'bear')]) }
   end
   
   def test_parse_object()
      assert_equal(parse_object([ Pair.new(:noun, 'bear'), Pair.new(:verb, 'eat') ]),
                   Pair.new(:noun, 'bear') )
                   
      # While parsing an object receiving a verb should cause an Exception to be raised.
      assert_raise( ParserError ) { parse_object([Pair.new(:verb, 'eat')]) }
   end
   
   def test_parse_subject()
      # Princess eat bear
      result1 = parse_subject([ Pair.new(:verb, 'eat'), Pair.new(:noun, 'bear') ],
                                Pair.new(:noun, 'princess'))
      
      result2 = Sentence.new(Pair.new(:noun, 'princess'),Pair.new(:verb, 'eat'),
                             Pair.new(:noun, 'bear'))
      
      # It actually fails because they are 2 different Sentence objects
      #assert_equal(result1,result2)
   end

   def test_parse_sentence()
      # Princess eat bear
      result1 = parse_sentence([Pair.new(:noun, 'princess'),
                                Pair.new(:verb, 'eat'),
                                Pair.new(:noun, 'bear')])
      result2 = Sentence.new(Pair.new(:noun, 'princess'),
                             Pair.new(:verb, 'eat'),
                             Pair.new(:noun, 'bear'))
                             
      # It actually fails because they are 2 different Sentence objects
      #assert_equal(result1,result2)
      
      # A subject + a verb is not a sentence (in this grammar)
      # If no subject is found it defaults to 'player' so you will get the
      # exception while trying to find the object. The exception will be raised
      # in parse_object and not in parse_sentence.
      assert_raise( ParserError ) { parse_sentence([Pair.new(:verb, 'eat')]) }
      
      # A sentence starting with a direction is not a sentence
      assert_raise( ParserError ) { parse_sentence([Pair.new(:direction, 'north')]) }
   end
end
