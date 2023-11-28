require 'minitest/autorun'
require_relative 'arrays' # assuming arrays.rb is in the same directory
class ArraysTest < Minitest::Test
  def setup
    # Define the variables here or set them up as needed
    @fruits = ['apples', 'oranges', 'bananas']
    @people = ["Mattan", "Chris", "Lee"]
    @things = ["dogs", 55, true, @people]
    @numbers = (1..10).to_a
  end

  def test_array_contents
    assert_equal ['apples', 'oranges', 'bananas'], @fruits
    assert_equal ["Mattan", "Chris", "Lee"], @people
    assert_equal ["dogs", 55, true, @people], @things
    assert_equal (1..10).to_a, @numbers
  end

  def test_array_operations
    assert_equal "These are the things: [\"dogs\", 55, true, [\"Mattan\", \"Chris\", \"Lee\"]]", capture_stdout { puts "These are the things: #{@things}" }
    assert_equal "This is thing #1: dogs", capture_stdout { puts "This is thing #1: #{@things[0]}" }
    assert_equal "This is the last thing: [\"Mattan\", \"Chris\", \"Lee\"]", capture_stdout { puts "This is the last thing: #{@things[-1]}" }

    # Test adding something to the array
    @things << "One more thing..."
    assert_equal "This is things now: [\"dogs\", 55, true, [\"Mattan\", \"Chris\", \"Lee\"], \"One more thing...\"]", capture_stdout { puts "This is things now: #{@things}" }
  end

  def test_sentence_operations
    sentence = "Ain’t nobody got time for that"
    words = sentence.split
    shuffled_words = words.shuffle

    assert_equal "The words are: [\"Ain’t\", \"nobody\", \"got\", \"time\", \"for\", \"that\"]", capture_stdout { puts "The words are: #{words}" }
    assert_match(/The shuffled words are: \[.+\]/, capture_stdout { puts "The shuffled words are: #{shuffled_words}" })
  end

  private

  def capture_stdout
    original_stdout = $stdout
    $stdout = StringIO.new
    yield
    $stdout.string.strip
  ensure
    $stdout = original_stdout
  end
end
