require 'minitest/autorun'
require_relative '../lib/bob'

class BobTest < Minitest::Test
  # --- 1. Testing "Whatever." (Anything else) ---

  def test_stating_something
    assert_equal "Whatever.", Bob.hey("Tom-ay-to, tom-ah-to.")
  end

  def test_only_numbers
    assert_equal "Whatever.", Bob.hey("1, 2, 3")
  end

  def test_statement_with_acronyms
    assert_equal "Whatever.", Bob.hey("It's OK if you don't want to go to the DMV.")
  end

  # --- 2. Testing "Sure." (Questions) ---

  def test_asking_a_question
    assert_equal "Sure.", Bob.hey("Does this cryogenic chamber make me look fat?")
  end

  def test_asking_a_numeric_question
    assert_equal "Sure.", Bob.hey("You are, what, like 15?")
  end

  def test_question_with_only_numbers
    assert_equal "Sure.", Bob.hey("4?")
  end

  # --- 3. Testing "Whoa, chill out!" (Yelling) ---

  def test_yelling
    assert_equal "Whoa, chill out!", Bob.hey("WATCH OUT!")
  end

  def test_yelling_with_numbers
    assert_equal "Whoa, chill out!", Bob.hey("1, 2, 3 GO!")
  end

  def test_yelling_with_special_characters
    assert_equal "Whoa, chill out!", Bob.hey("ZOMG THE %^*@#$(*^ ZOMBIES ARE HERE!!11!!1!")
  end

  # --- 4. Testing "Calm down, I know what I'm doing!" (Yelled Questions) ---

  def test_yelling_a_question
    assert_equal "Calm down, I know what I'm doing!", Bob.hey("WHAT THE HECK WERE YOU THINKING?")
  end

  # --- 5. Testing "Fine. Be that way!" (Silence) ---

  def test_silence
    assert_equal "Fine. Be that way!", Bob.hey("")
  end

  def test_prolonged_silence_with_spaces
    assert_equal "Fine. Be that way!", Bob.hey("          ")
  end

  def test_silence_with_various_whitespace_characters
    assert_equal "Fine. Be that way!", Bob.hey("\t\t\t\t\t\t\t\t\t\t")
  end

  # --- 6. Edge Cases (Trailing/Leading Whitespace) ---

  def test_starting_with_whitespace
    assert_equal "Whatever.", Bob.hey("         hmmmmmmm...")
  end

  def test_question_with_trailing_whitespace
    # A common bug is checking the exact last character without stripping whitespace first!
    assert_equal "Sure.", Bob.hey("Are you going to be OK?   ")
  end
end
