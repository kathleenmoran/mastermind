# frozen_string_literal: true
require_relative 'player'
require_relative 'person'
require_relative 'computer'
require_relative 'code'
require_relative 'displayable'

# represents a game of mastermind
class Game
  include Displayable
  ROUNDS = 12
  def initialize(codebreaker = Person.new, codemaker = Computer.new)
    @codebreaker = codebreaker
    @codemaker = codemaker
    @master_code = @codemaker.make_code
  end

  def play_round(round)
    print_round_message(round)
    round_guess = @codebreaker.guess
    puts round_guess.to_s_with_clues(@master_code)
    end_game(true) if round_guess == master_code
  end

  def play_game
    ROUNDS.times { |index| play_round(index) }
    end_game(false)
  end

  def end_game(outcome)
    print_game_outcome_message(outcome)
    print_code_reveal_message
    puts @master_code
    ask_to_play_again
  end

  def ask_to_play_again
    print_ask_to_play_again_message
    user_input = gets.chomp
    if %w[y yes].include?(user_input)
      # do something
    elsif %w[n no].include?(user_input)
      print_quit_game_message
      exit
    else
      print_invalid_play_again_message
      ask_to_play_again
    end
  end
end
