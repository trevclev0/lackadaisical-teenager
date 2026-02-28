# frozen_string_literal: true

class Bob
  # Returns a response to the given remark based on the following rules:
  #
  # - If the remark is empty, return 'Fine. Be that way!'
  # - If the remark is both yelling and a question, return "Calm down, I know what I'm doing!"
  # - If the remark is yelling, return 'Whoa, chill out!'
  # - If the remark is a question, return 'Sure.'
  # - Otherwise, return 'Whatever.'
  def self.hey(remark)
    stripped = remark.to_s.strip # ensure string before removing whitespace

    case
    when silence?(stripped) then 'Fine. Be that way!'
    when yelling_question?(stripped) then "Calm down, I know what I'm doing!"
    when yelling?(stripped) then 'Whoa, chill out!'
    when question?(stripped) then 'Sure.'
    else 'Whatever.'
    end
  end

  class << self
    private

    # Returns true if the given string is empty, false otherwise.
    def silence?(str) = str.empty?

    # Returns true if the given string is both yelling and a question, false otherwise.
    def yelling_question?(str) = yelling?(str) && question?(str)

    # Returns true if the given string is all uppercase and contains at least one letter, false otherwise.
    # RegEx checks if string contains at least one letter
    def yelling?(str) = str.match?(/[[:alpha:]]/) && str == str.upcase

    # Returns true if the given string ends with a question mark, false otherwise.
    # RegEx checks if string ends with one or more question marks
    # Strips all exclamation marks from the end of the string before checking.
    def question?(str) = str.sub(/!*$/, '').end_with?('?')
  end
end
