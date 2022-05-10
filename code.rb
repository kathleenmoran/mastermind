# frozen_string_literal: true

require_relative 'displayable'

# either a guess of the codebreaker or the codemaker's code
class Code
  include Displayable
  attr_reader :values

  def initialize(values)
    @values = values
  end

  def ==(other)
    @values == other.values
  end

  def to_s_with_clues(master_code)
    "#{self}   #{clues_to_s(master_code)}\n\n"
  end

  def same_number_of_spots?(total_correct_spots, total_wrong_spots, master_code)
    sum_correct_spot(master_code) == total_correct_spots && sum_wrong_spot(master_code) == total_wrong_spots
  end

  def sum_correct_spot(master_code)
    total = 0
    master_code.values.each_with_index do |value, index|
      total += 1 if @values[index] == value
    end
    total
  end

  def sum_wrong_spot(master_code)
    total = 0
    encountered = Hash.new(0)
    master_code.values.each_with_index do |value, index|
      total += 1 if encountered[value] < @values.count(value) && @values[index] != value && @values.include?(value)
      encountered[value] += 1
    end
    total
  end

  private

  def to_s
    @values.reduce('') { |code, value| code + color_value(value) }
  end

  def clues_to_s(master_code)
    "Clues: #{correct_spots_to_s(sum_correct_spot(master_code))}#{wrong_spots_to_s(sum_wrong_spot(master_code))}"
  end

  def correct_spots_to_s(total_spots)
    '● ' * total_spots
  end

  def wrong_spots_to_s(total_spots)
    '○ ' * total_spots
  end
end
