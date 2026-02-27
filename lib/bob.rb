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
      return str.empty?
    end

    def yelling_question?(str)
      return yelling?(str) && question?(str)
    end

    def yelling?(str)
      letters = str.scan(/[[:alpha:]]/)
      !letters.empty? && letters.all? { |c| c == c.upcase }
    end

    def question?(str)
      return str[-1] == '?' || elevated_question?(str)
    end

    def get_num_ending_exclamations(str)
      match = str.match(/(!+)$/)
      if match
        return match[1].length
      end
      return 0
    end

    def elevated_question?(str)
      num_ending_exclamations = get_num_ending_exclamations(str)
      return num_ending_exclamations > 0 && str[-(num_ending_exclamations + 1)] == '?'
    end
  end
end
