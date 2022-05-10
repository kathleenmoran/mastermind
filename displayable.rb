# frozen_string_literal: true

# contains methods to print messages to the console
module Displayable
  DIGIT_COLORS = { 1 => :yellow, 2 => :blue, 3 => :green, 4 => :magenta, 5 => :red, 6 => :cyan }.freeze
  BACKGROUND_COLORS = { yellow: '43', blue: '44', green: '42', magenta: '45', red: '41', cyan: '46' }.freeze

  def print_round_message(round)
    puts underline("Turn ##{round + 1}:")
  end

  def print_person_guess_prompt
    puts 'Type in four numbers (1-6) to guess the code.'
  end

  def print_computer_guess_prompt
    puts 'The computer is generating its guess...'
  end

  def print_invalid_input_message
    puts 'Invalid input. Your code should only be 4 digits between 1 and 6.'
  end

  def underline(text)
    "\e[4m#{text}\e[0m"
  end

  def color_text_background(text, color)
    "\033[#{BACKGROUND_COLORS[color]}m#{text}\033[0m"
  end

  def color_value(value)
    color_text_background("  #{value}  ", DIGIT_COLORS[value])
  end

  def print_invalid_message
    puts "That's an invalid response."
  end

  def print_game_outcome_message(codebreaker_won)
    puts "Game over. The codebreaker #{codebreaker_won ? 'won' : 'lost'}!\n\n"
  end

  def print_code_reveal_message
    puts "Here is the correct 'master code':"
  end

  def print_input_code_message
    puts 'Please enter your code:'
  end
end
