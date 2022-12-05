# frozen_string_literal: true

require_relative '../puzzle'

# Day 1: Calorie Counting
class Day01 < Puzzle
  def part1
    calorie_packages.max_by(&:sum).sum
  end

  private

  def calorie_packages
    input.split("\n\n").map { _1.lines(chomp: true).map(&:to_i) }
  end

  def input
    @input ||= File.open('./01/input.txt').read
  end
end
