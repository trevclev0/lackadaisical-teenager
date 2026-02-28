# frozen_string_literal: true

class Bob
  class << self
    def hey(remark)
      remark = remark.strip # strip whitespace

      return 'Fine. Be that way!' if silence?(remark)
      return "Calm down, I know what I'm doing!" if yelling_question?(remark)
      return 'Whoa, chill out!' if yelling?(remark)
      return 'Sure.' if question?(remark)

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
      str.match?(/[[:alpha:]]/) && str == str.upcase
    end

    def question?(str)
      str.sub(/!*$/, '').end_with?('?')
    end
  end
end
