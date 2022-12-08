# frozen_string_literal: true

require_relative '../puzzle'

# Day 3: Rucksack Reorganization
class Day06 < Puzzle
  def part1
    input.chars.each.with_index do |letter, i|
      next unless i >= 4 && !input.chars[i - 4..i - 1].include?(letter) && input.chars[i - 4..i - 1].uniq.count == 4

      break i
    end
  end

  def part2
    input.chars.each.with_index do |_letter, i|
      next unless i >= 14 && input.chars[i - 14..i - 1].uniq.count == 14

      break i
    end
  end

  private

  def input
    @input ||= File.open('./06/input.txt').read
  end
end
