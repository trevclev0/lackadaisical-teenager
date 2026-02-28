# frozen_string_literal: true

# Bob is a lackadaisical teenager who responds to remarks in a predictable way.
# He only responds to the tone and structure of remarks, not their content.
class Bob
  # Returns a response to the given remark based on the following rules:
  #
  # - If the remark is empty, return 'Fine. Be that way!'
  # - If the remark is both yelling and a question, return "Calm down, I know what I'm doing!"
  # - If the remark is yelling, return 'Whoa, chill out!'
  # - If the remark is a question, return 'Sure.'
  # - Otherwise, return 'Whatever.'
  def self.hey(remark)
    stripped = remark.to_s.strip

    return 'Fine. Be that way!' if silence?(stripped)
    return "Calm down, I know what I'm doing!" if yelling_question?(stripped)
    return 'Whoa, chill out!' if yelling?(stripped)
    return 'Sure.' if question?(stripped)

    'Whatever.'
  end

  # Returns true if the given string is empty, false otherwise.
  def self.silence?(str) = str.empty?

  # Returns true if the given string is both yelling and a question, false otherwise.
  def self.yelling_question?(str) = yelling?(str) && question?(str)

  # Returns true if the given string is all uppercase and contains at least one letter.
  def self.yelling?(str) = str.match?(/[[:alpha:]]/) && str == str.upcase

  # Returns true if the given string ends with a question mark, after stripping trailing exclamation marks.
  def self.question?(str) = str.sub(/!+\z/, '').end_with?('?')

  private_class_method :silence?, :yelling_question?, :yelling?, :question?
end
