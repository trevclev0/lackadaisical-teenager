require 'minitest/autorun'
require_relative '../lib/bob'

class BobTestC < Minitest::Test
  # --- Questions ---
  def test_question
    skip
    assert_equal "Sure.", Bob.hey("How are you?")
  end

  def test_question_with_leading_whitespace
    skip
    assert_equal "Sure.", Bob.hey("   Are you okay?")
  end

  def test_question_with_mixed_case
    skip
    assert_equal "Sure.", Bob.hey("Is this working?")
  end

  def test_question_with_numbers
    skip
    assert_equal "Sure.", Bob.hey("Is 5 greater than 3?")
  end

  def test_non_letter_question
    skip
    assert_equal "Sure.", Bob.hey("4?")
  end

  # --- Yelling (non-question) ---
  def test_yelling_statement
    skip
    assert_equal "Whoa, chill out!", Bob.hey("HELLO!")
  end

  def test_yelling_with_exclamation
    skip
    assert_equal "Whoa, chill out!", Bob.hey("STOP DOING THAT!")
  end

  def test_yelling_with_spaces
    skip
    assert_equal "Whoa, chill out!", Bob.hey("I JUST WANT TO TALK TO YOU")
  end

  def test_yelling_with_numbers_and_letters
    skip
    assert_equal "Whoa, chill out!", Bob.hey("WATCH OUT 2025!")
  end

  def test_lowercase_is_not_yelling
    skip
    assert_equal "Whatever.", Bob.hey("hello there")
  end

  def test_numbers_only_is_not_yelling
    skip
    assert_equal "Whatever.", Bob.hey("1234 5678")
  end

  # --- Yelling a question ---
  def test_yelling_a_question
    skip
    assert_equal "Calm down, I know what I'm doing!", Bob.hey("WHAT THE HECK ARE YOU DOING?")
  end

  def test_yelling_question_with_mixed_symbols
    skip
    assert_equal "Calm down, I know what I'm doing!", Bob.hey("ARE YOU SERIOUS?")
  end

  def test_yelling_multiple_sentences_ending_in_question
    skip
    assert_equal "Calm down, I know what I'm doing!", Bob.hey("I CAN'T BELIEVE THIS. ARE YOU KIDDING?")
  end

  # --- Silence ---
  def test_empty_string
    skip
    assert_equal "Fine. Be that way!", Bob.hey("")
  end

  def test_only_spaces
    skip
    assert_equal "Fine. Be that way!", Bob.hey("   ")
  end

  def test_only_tabs
    skip
    assert_equal "Fine. Be that way!", Bob.hey("\t\t\t")
  end

  def test_only_newlines
    skip
    assert_equal "Fine. Be that way!", Bob.hey("\n\n")
  end

  def test_mixed_whitespace
    skip
    assert_equal "Fine. Be that way!", Bob.hey("  \t  \n  ")
  end

  # --- Whatever (everything else) ---
  def test_statement
    skip
    assert_equal "Whatever.", Bob.hey("Tom-ay-to, tom-aaaah-to.")
  end

  def test_statement_with_numbers
    skip
    assert_equal "Whatever.", Bob.hey("I have 3 cats.")
  end

  def test_random_punctuation
    skip
    assert_equal "Whatever.", Bob.hey("Let's go to the mall!")
  end

  def test_mixed_case_is_not_yelling
    skip
    assert_equal "Whatever.", Bob.hey("Hello Bob, how are You.")
  end

  def test_ellipsis
    skip
    assert_equal "Whatever.", Bob.hey("Okay...")
  end

  def test_statement_with_question_mark_mid_sentence
    # Not ending with ?, so not a question
    skip
    assert_equal "Whatever.", Bob.hey("Wait, is this? No it isn't")
  end

  # --- Edge cases ---
  def test_question_mark_only
    skip
    assert_equal "Sure.", Bob.hey("?")
  end

  def test_yelling_with_trailing_whitespace
    skip
    assert_equal "Whoa, chill out!", Bob.hey("YELLING  ")
  end

  def test_yelling_question_with_trailing_whitespace
    # Assumption: trailing whitespace after '?' still counts as a yelled question
    skip
    assert_equal "Calm down, I know what I'm doing!", Bob.hey("ARE YOU SURE?  ")
  end

  def test_multiple_question_marks
    skip
    assert_equal "Sure.", Bob.hey("What???")
  end
end
