# frozen_string_literal: true

# contains methods to print messages to the console
module Displayable
  def print_start_game_message
    puts "It's time to play!"
  end

  def print_round_message(round)
    puts "Turn ##{round + 1}: Type in four numbers (1-6) to guess the code."
  end

  def print_invalid_guess_message
    puts 'Incorrect input. Your guess should only be 5 digits between 1 and 6.'
  end

  def color_value(value)
    "  #{value}  "
  end

  def print_ask_to_play_again_message
    puts 'Do you want to play again? (Y/N)'
  end

  def print_quit_game_message
    puts 'Thank you for playing Mastermind!'
  end

  def print_invalid_play_again_message
    puts "That's an invalid response"
  end

  def print_game_outcome_message(codebreaker_won)
    puts "Game over. The codebreaker #{codebreaker_won ? 'won' : 'lost'}!"
  end

  def print_code_reveal_message
    puts "Here is the correct 'master code':"
  end
end
