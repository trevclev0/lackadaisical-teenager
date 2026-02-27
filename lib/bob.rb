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
      letters = str.scan(/[[:alpha:]]/)
      !letters.empty? && letters.all? { |c| c == c.upcase }
    end

    def question?(str)
      str[-1] == '?' || elevated_question?(str)
    end

    def ending_exclamation_count(str)
      match = str.match(/(!+)$/)
      match&.[](1)&.length || 0
    end

    def elevated_question?(str)
      count = ending_exclamation_count(str)
      count > 0 && str[-(count + 1)] == '?'
    end
  end
end
