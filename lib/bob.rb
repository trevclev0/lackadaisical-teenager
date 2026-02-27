class Bob
  class << self
    def hey(remark)
      remark = remark.strip # strip whitespace

      if is_silence(remark)
        return 'Fine. Be that way!'
      end

      if is_yelling_question(remark)
        return "Calm down, I know what I'm doing!"
      end

      if is_yelling(remark)
        return 'Whoa, chill out!'
      end

      if is_question(remark)
        return 'Sure.'
      end

      'Whatever.'
    end

    private

    def is_silence(str)
      return str.empty?
    end

    def is_yelling_question(str)
      return is_yelling(str) && is_question(str)
    end

    def is_yelling(str)
      return str.upcase == str && str.match(/[A-Z]/)
    end

    def is_question(str)
      return str[-1] == '?' || is_elevated_question(str)
    end

    def get_num_ending_exclamations(str)
      match = str.match(/(!+)$/)
      if match
        return match[1].length
      end
      return 0
    end

    def is_elevated_question(str)
      num_ending_exclamations = get_num_ending_exclamations(str)
      return num_ending_exclamations > 0 && str[-(num_ending_exclamations + 1)] == '?'
    end
  end
end
