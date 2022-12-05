# frozen_string_literal: true

require_relative '../puzzle'

# Day 3: Rucksack Reorganization
class Day03 < Puzzle
  PRIORITIES = ('a'..'z').to_a.concat(('A'..'Z').to_a).freeze

  def part1
    input.lines(chomp: true)
         .map { _1.chars.each_slice(_1.size / 2).to_a }
         .sum { priority((_1 & _2).first) }
  end

  def part2
    input.lines(chomp: true)
         .each_slice(3).to_a
         .sum { priority((_1.chars & _2.chars & _3.chars).first) }
  end

  private

  def priority(letter)
    PRIORITIES.index(letter) + 1
  end

  def input
    @input ||= File.open('./03/input.txt').read
  end
end
