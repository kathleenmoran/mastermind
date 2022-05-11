# frozen_string_literal: true

# the codemaker and codebreaker
class Player
  attr_reader :type

  def initialize(type)
    @type = type
  end

  def make_code
    type.make_code
  end

  def guess
    type.guess
  end
end
