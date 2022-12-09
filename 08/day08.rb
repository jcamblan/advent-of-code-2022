# frozen_string_literal: true

require_relative '../puzzle'

# Day 8: Treetop Tree House
class Day08 < Puzzle
  def part1
    forest = parse_forest do |line, li, tree, ti, column|
      ti.zero? ||
        li.zero? ||
        line[0...ti].all? { _1 < tree } ||
        line[ti + 1..].all? { _1 < tree } ||
        column[0...li].all? { _1 < tree } ||
        column[li + 1..].all? { _1 < tree }
    end

    forest.flatten.count(true)
  end

  def part2
    forest = parse_forest do |line, li, tree, ti, column|
      [length_of_sight(line[0...ti].reverse, tree),
       length_of_sight(line[ti + 1..], tree),
       length_of_sight(column[0...li].reverse, tree),
       length_of_sight(column[li + 1..], tree)].inject(&:*)
    end

    forest.flatten.max
  end

  private

  def length_of_sight(other_trees, tree)
    num = 0
    other_trees.each do |t|
      num += 1
      break if t >= tree
    end
    num
  end

  def parse_forest
    forest = input.lines(chomp: true).map(&:chars)

    forest.map.with_index do |line, li|
      line.map.with_index do |tree, ti|
        column = forest.map { _1[ti] }

        yield(line, li, tree, ti, column)
      end
    end
  end

  def input
    @input ||= File.open('./08/input.txt').read
  end
end
