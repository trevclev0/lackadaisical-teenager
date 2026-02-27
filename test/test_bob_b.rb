require 'minitest/autorun'
require_relative '../lib/bob'

class BobTest < Minitest::Test
  #
  # Questions
  #
  def test_answers_a_simple_question
    assert_equal 'Sure.', Bob.hey('How are you?')
  end

  def test_answers_a_numeric_question
    assert_equal 'Sure.', Bob.hey('4?')
  end

  def test_answers_question_with_mixed_punctuation
    assert_equal 'Sure.', Bob.hey('Does this cry?!')
  end

  #
  # Yelling
  #
  def test_responds_to_all_caps_statement
    assert_equal 'Whoa, chill out!', Bob.hey('WATCH OUT!')
  end

  def test_responds_to_shouting_with_numbers
    assert_equal 'Whoa, chill out!', Bob.hey('1, 2, 3 GO!')
  end

  def test_responds_to_unicode_shouting
    assert_equal 'Whoa, chill out!', Bob.hey('ÜMLÄÜTS!')
  end

  #
  # Yelled questions
  #
  def test_responds_to_shouted_question
    assert_equal "Calm down, I know what I'm doing!", Bob.hey('WHAT THE HECK?')
  end

  def test_yelled_question_takes_precedence
    assert_equal "Calm down, I know what I'm doing!", Bob.hey('ZOMG THE %^*@?')
  end

  #
  # Silence
  #
  def test_empty_string_is_silence
    assert_equal 'Fine. Be that way!', Bob.hey('')
  end

  def test_whitespace_is_silence
    assert_equal 'Fine. Be that way!', Bob.hey('   ')
    assert_equal 'Fine. Be that way!', Bob.hey("\t\n")
  end

  #
  # Other statements
  #
  def test_regular_statement
    assert_equal 'Whatever.', Bob.hey('Tom-ay-to, tom-aaaah-to.')
  end

  def test_numbers_without_question_or_yelling
    assert_equal 'Whatever.', Bob.hey('1, 2, 3')
  end

  def test_mixed_case_not_yelling
    assert_equal 'Whatever.', Bob.hey("Let's go make out behind the gym")
  end

  #
  # Edge cases table test
  #
  def test_multiple_cases
    cases = {
      "WATCH OUT!" => 'Whoa, chill out!',
      "How are you?" => 'Sure.',
      "" => 'Fine. Be that way!',
      "   " => 'Fine. Be that way!',
      "This is fine." => 'Whatever.',
      "WHAT?" => "Calm down, I know what I'm doing!",
      "1, 2, 3?" => 'Sure.'
    }

    cases.each do |input, expected|
      assert_equal expected, Bob.hey(input), "Expected #{input.inspect} to return #{expected.inspect}"
    end
  end
end
