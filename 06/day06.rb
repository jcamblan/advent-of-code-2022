# frozen_string_literal: true

require_relative '../puzzle'

# Day 3: Rucksack Reorganization
class Day06 < Puzzle
  def part1
    find_marker do |i, input, letter|
      i >= 4 && !input.chars[i - 4..i - 1].include?(letter) &&
        input.chars[i - 4..i - 1].uniq.count == 4
    end
  end

  def part2
    find_marker do |i, input, _|
      i >= 14 && input.chars[i - 14..i - 1].uniq.count == 14
    end
  end

  private

  def find_marker
    input.chars.each.with_index do |letter, i|
      next unless yield(i, input, letter)

      break i
    end
  end

  def input
    @input ||= File.open('./06/input.txt').read
  end
end
