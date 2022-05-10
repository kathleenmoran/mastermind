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
    @game_over = false
  end

  def play_round(round)
    print_round_message(round)
    round_guess = @codebreaker.guess
    puts round_guess.to_s_with_clues(@master_code)
    @game_over = true if round_guess == @master_code
    change_prev_guess(round_guess) if @codebreaker.is_a?(Computer)
  end

  def change_prev_guess(guess)
    @codebreaker.prev_code = guess
    @codebreaker.prev_total_correct_spots = guess.sum_correct_spot(@master_code)
    @codebreaker.prev_total_wrong_spots = guess.sum_wrong_spot(@master_code)
  end

  def play_game
    ROUNDS.times do |index|
      play_round(index)
      if @game_over
        end_game(true)
        break
      end
    end
    end_game(false) unless @game_over
  end

  def end_game(outcome)
    print_game_outcome_message(outcome)
    return if outcome

    print_code_reveal_message
    puts @master_code
  end
end
