# frozen_string_literal: true

require_relative '../puzzle'

# Day 3: Rucksack Reorganization
class Day03 < Puzzle
  PRIORITIES = ('a'..'z').to_a.concat(('A'..'Z').to_a).freeze

  def part1
    input.lines(chomp: true)
         .map { _1.chars.each_slice(_1.size / 2).to_a }
         .map { (_1 & _2).first }
         .map { priority(_1) }
         .sum
  end

  private

  def priority(letter)
    PRIORITIES.index(letter) + 1
  end

  def input
    @input ||= File.open('./03/input.txt').read
  end
end
