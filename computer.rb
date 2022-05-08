# frozen_string_literal: true

# the automated mastermind player
class Computer < Player
  def make_code
    Code.new(Array.new(CODE_LENGTH) { rand(1..MAX_CODE_VALUE) })
  end
end
