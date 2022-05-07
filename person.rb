# frozen_string_literal: true

# user playing mastermind
class Person < Player
  def guess
    user_guess = gets.chomp
    input_to_guess(user_guess)
  end

  def input_to_guess(input)
    if valid_guess_input?(input)
      Code.new(input.split('').map(&:to_i))
    else
      print_invalid_input_message
      guess
    end
  end

  def valid_guess_input?(input)
    input.split('').all? { |value| value.to_i.to_s == value && value.to_i.between?(1, 6) }
  end
end
