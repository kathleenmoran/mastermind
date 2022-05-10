# frozen_string_literal: true

require_relative 'displayable'

# user playing mastermind
class Person < Player
  include Displayable
  def guess
    print_person_guess_prompt
    user_input = gets.chomp
    input_to_code(user_input, true)
  end

  def input_to_code(input, is_guess)
    if valid_guess_input?(input)
      Code.new(input.split('').map(&:to_i))
    else
      print_invalid_message
      return guess if is_guess

      return make_code unless is_guess
    end
  end

  def valid_guess_input?(input)
    input.split('').all? { |val| val.to_i.to_s == val && val.to_i.between?(1, 6) } && input.split('').length == 4
  end

  def make_code
    print_input_code_message
    user_input = gets.chomp
    puts ''
    input_to_code(user_input, false)
  end
end
