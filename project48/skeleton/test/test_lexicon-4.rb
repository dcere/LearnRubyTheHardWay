require 'test/unit'
require '../lib/lexicon-4'

class LexiconTests < Test::Unit::TestCase

   Pair = Lexicon::Pair
   @@lexicon = Lexicon.new()
   
   def test_directions()
      # Simple tests
      assert_equal(@@lexicon.is_direction?("north"), true)
      assert_equal(@@lexicon.is_direction?("south"), true)
      
      # Real tests
      assert_equal([Pair.new(:direction, 'north')], @@lexicon.scan("north"))
      result = @@lexicon.scan("north south east")
      assert_equal(result, [Pair.new(:direction, 'north'),
                   Pair.new(:direction, 'south'),
                   Pair.new(:direction, 'east')])
      
      # Case tests
      assert_equal([Pair.new(:direction, 'north')], @@lexicon.scan("nOrTh"))
   end
   
   def test_verbs()
      # Simple tests
      assert_equal(@@lexicon.is_verb?("go"), true)
      assert_equal(@@lexicon.is_verb?("kill"), true)
      
      # Real tests
      assert_equal(@@lexicon.scan("go"), [Pair.new(:verb, 'go')])
      result = @@lexicon.scan("go kill eat")
      assert_equal(result, [Pair.new(:verb, 'go'),
                   Pair.new(:verb, 'kill'),
                   Pair.new(:verb, 'eat')])

      # Case tests
      assert_equal([Pair.new(:verb, 'kill')], @@lexicon.scan("kIlL"))
   end

   def test_stops()
      assert_equal(@@lexicon.scan("the"), [Pair.new(:stop, 'the')])
      result = @@lexicon.scan("the in of")
      assert_equal(result, [Pair.new(:stop, 'the'),
                   Pair.new(:stop, 'in'),
                   Pair.new(:stop, 'of')])
      # Case tests
      assert_equal([Pair.new(:stop, 'the')], @@lexicon.scan("ThE"))
  end

   def test_nouns()
      assert_equal(@@lexicon.scan("bear"), [Pair.new(:noun, 'bear')])
      result = @@lexicon.scan("bear princess")
      assert_equal(result, [Pair.new(:noun, 'bear'),
                   Pair.new(:noun, 'princess')])

      # Case tests
      assert_equal([Pair.new(:noun, 'princess')], @@lexicon.scan("pRiNcEsS"))
  end

   def test_numbers()
      assert_equal(@@lexicon.scan("1234"), [Pair.new(:number, 1234)])
      result = @@lexicon.scan("3 91234")
      assert_equal(result, [Pair.new(:number, 3),
                   Pair.new(:number, 91234)])
                   
      # Case tests
      assert_equal([Pair.new(:number, 1984)], @@lexicon.scan("1984"))
  end

   def test_errors()
      assert_equal(@@lexicon.scan("ASDFADFASDF"), [Pair.new(:error, 'ASDFADFASDF')])
      result = @@lexicon.scan("bear IAS princess")
      assert_equal(result, [Pair.new(:noun, 'bear'),
                   Pair.new(:error, 'IAS'),
                   Pair.new(:noun, 'princess')])
      # Case tests
      assert_equal([Pair.new(:error, 'sHuRmaNiKo')], @@lexicon.scan("sHuRmaNiKo"))
   end

end
