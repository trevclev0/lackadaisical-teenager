require 'minitest/autorun'
require_relative '../lib/bob'

class BobTestD < Minitest::Test
  #
  # Silence
  #
  def test_stating_nothing
    assert_equal 'Fine. Be that way!', Bob.hey('')
  end

  def test_shouting_nothing
    assert_equal 'Fine. Be that way!', Bob.hey('   ')
  end

  def test_tabs_and_newlines_are_silence
    assert_equal 'Fine. Be that way!', Bob.hey("\n\t  \t\n")
  end

  #
  # Questions
  #
  def test_question
    assert_equal 'Sure.', Bob.hey('How are you?')
  end

  def test_question_with_trailing_whitespace
    assert_equal 'Sure.', Bob.hey("Are you OK?   ")
  end

  def test_numeric_question
    assert_equal 'Sure.', Bob.hey('4?')
  end

  def test_question_with_only_symbols
    assert_equal 'Sure.', Bob.hey('???')
  end

  #
  # Yelling
  #
  def test_yelling
    assert_equal 'Whoa, chill out!', Bob.hey('WATCH OUT!')
  end

  def test_yelling_with_special_characters
    assert_equal 'Whoa, chill out!', Bob.hey('FCECDFCAAB!')
  end

  def test_yelling_with_numbers
    assert_equal 'Whoa, chill out!', Bob.hey('1, 2, 3 GO!')
  end

  def test_yelling_with_unicode_letters
    assert_equal 'Whoa, chill out!', Bob.hey('ÜMLÄÜTS!')
  end

  #
  # Yelled questions (highest priority)
  #
  def test_yelled_question
    assert_equal "Calm down, I know what I'm doing!", Bob.hey('WHAT ARE YOU DOING?')
  end

  def test_yelled_question_with_symbols
    assert_equal "Calm down, I know what I'm doing!", Bob.hey('ZOMG THE %^*@?')
  end

  def test_yelled_question_with_trailing_spaces
    assert_equal "Calm down, I know what I'm doing!", Bob.hey("WHAT?   ")
  end

  #
  # Non-yelling statements
  #
  def test_statement
    assert_equal 'Whatever.', Bob.hey('Tom-ay-to, tom-aaaah-to.')
  end

  def test_lowercase_statement
    assert_equal 'Whatever.', Bob.hey('Let us go make out behind the gym!')
  end

  def test_mixed_case_statement
    assert_equal 'Whatever.', Bob.hey('This Is Not Yelling')
  end

  #
  # Edge cases that commonly fail
  #
  def test_numbers_are_not_yelling
    assert_equal 'Whatever.', Bob.hey('1, 2, 3')
  end

  def test_symbols_without_letters_are_not_yelling
    assert_equal 'Whatever.', Bob.hey('!@#$%^&*')
  end

  def test_multiline_question
    assert_equal 'Sure.', Bob.hey("Does this work?\nYes?")
  end

  def test_multiline_yelling
    assert_equal 'Whoa, chill out!', Bob.hey("HELLO\nWORLD!")
  end

  def test_gibberish
    assert_equal 'Whatever.', Bob.hey('asdfghjkl')
  end
end
