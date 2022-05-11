# frozen_string_literal: true

require_relative 'displayable'
require_relative 'codable'

# user playing mastermind
class Person
  include Displayable
  include Codable
  def guess
    print_person_guess_prompt
    user_input = gets.chomp
    input_to_code(user_input, true)
  end

  def make_code
    print_input_code_message
    user_input = gets.chomp
    puts ''
    input_to_code(user_input, false)
  end

  private

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
    input.split('').all? do |val|
      val.to_i.to_s == val && val.to_i.between?(1, MAX_CODE_VALUE) && input.split('').length == CODE_LENGTH
    end
  end
end
