# frozen_string_literal: true

class Bob
  class << self
    def hey(remark)
      stripped = remark.to_s.strip # ensure string before removing whitespace

      return 'Fine. Be that way!' if silence?(stripped)
      return "Calm down, I know what I'm doing!" if yelling_question?(stripped)
      return 'Whoa, chill out!' if yelling?(stripped)
      return 'Sure.' if question?(stripped)

      'Whatever.'
    end

    private

    def silence?(str)
      str.empty?
    end

    def yelling_question?(str)
      yelling?(str) && question?(str)
    end

    def yelling?(str)
      # RegEx checks if string contains at least one letter
      str.match?(/[[:alpha:]]/) && str == str.upcase
    end

    def question?(str)
      # Removing all exclamation marks at the end in case it's a yelling question
      str.sub(/!*$/, '').end_with?('?')
    end
  end
end
