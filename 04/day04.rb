# frozen_string_literal: true

require_relative '../puzzle'

# Day 4: Camp Cleanup
class Day04 < Puzzle
  def part1
    ranges.count { _1.include?(_1.inject(&:&)) }
  end

  def part2
    ranges.count { _1.inject(&:&).any? }
  end

  private

  def ranges
    input.lines(chomp: true)
         .map { _1.split(',').map { |s| eval(s.gsub('-', '..')).to_a } }
  end

  def input
    @input ||= File.open('./04/input.txt').read
  end
end
