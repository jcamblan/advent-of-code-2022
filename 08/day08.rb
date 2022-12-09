# frozen_string_literal: true

require_relative '../puzzle'

# Day 8: Treetop Tree House
class Day08 < Puzzle
  def part1
    forest = input.lines(chomp: true).map(&:chars)

    res = forest.map.with_index do |line, li|
      line.map.with_index do |tree, ti|
        column = forest.map { _1[ti] }

        ti.zero? ||
          li.zero? ||
          line[0..ti - 1].all? { _1 < tree } ||
          line[ti + 1..].all? { _1 < tree } ||
          column[0..li - 1].all? { _1 < tree } ||
          column[li + 1..].all? { _1 < tree }
      end
    end

    res.flatten.count(true)
  end

  private

  def input
    @input ||= File.open('./08/input.txt').read
  end
end
