# frozen_string_literal: true

require_relative 'code'
require_relative 'displayable'

# the automated mastermind player
class Computer < Player
  include Displayable
  FIRST_GUESS = Code.new([1, 1, 2, 2])
  attr_writer :prev_code, :prev_total_correct_spots, :prev_total_wrong_spots

  def initialize
    super
    @permutations = (1..MAX_CODE_VALUE).to_a.repeated_permutation(4).to_a
    @guesses_made = 0
    @prev_code = nil
    @prev_total_correct_spots = nil
    @prev_total_wrong_spots = nil
  end

  def make_code
    Code.new(Array.new(CODE_LENGTH) { rand(1..MAX_CODE_VALUE) })
  end

  def guess
    print_computer_guess_prompt
    sleep 2
    if @guesses_made.zero?
      @guesses_made += 1
      FIRST_GUESS
    else
      @guesses_made += 1
      filter_permutations
      Code.new(@permutations[0])
    end
  end

  private

  # removes permutations from the list that would not have the same pegs if the previous response were the master code
  def filter_permutations
    @permutations = @permutations.select do |permutation|
      @prev_code.same_number_of_spots?(@prev_total_correct_spots, @prev_total_wrong_spots, Code.new(permutation))
    end
  end
end
