class Bob
  class << self
    def hey(remark)
      remark = remark.strip # strip whitespace

      if remark[-1] == '?' || is_elevated_question(remark)
        if is_yelling(remark)
          return "Calm down, I know what I'm doing!"
        end
        return 'Sure.'
      end

      if is_yelling(remark)
        return 'Whoa, chill out!'
      end

      if remark.empty?
        return 'Fine. Be that way!'
      end

      'Whatever.'
    end

    private

    def is_yelling(str)
      return str.upcase == str && str.match(/[A-Z]/)
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
