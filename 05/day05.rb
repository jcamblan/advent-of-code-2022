# frozen_string_literal: true

require_relative '../puzzle'

# Day 5: Supply Stacks
class Day05 < Puzzle
  def part1
    boxes_input, commands = input.split("\n\n").map { _1.lines(chomp: true) }

    proceed_commands(commands, fill_boxes(boxes_input)).flat_map(&:first).join
  end

  def part2
    boxes_input, commands = input.split("\n\n").map { _1.lines(chomp: true) }
    proceed_commands(commands, fill_boxes(boxes_input), crate_mover: '9001').flat_map(&:first).join
  end

  private

  def fill_boxes(boxes_input)
    boxes_input[-1].chars.map(&:to_i).each_with_object([]).with_index do |(el, acc), index|
      next unless el.positive?
      acc << boxes_input[..-2].filter_map { _1.chars[index] if _1.chars[index].match?(/[A-Z]{1}/) }
    end
  end

  def proceed_commands(commands, boxes, crate_mover: '9000')
    commands.each do |command|
      count, from, to = parse_command(command)
      moved_crates = boxes[from.to_i - 1].shift(count.to_i)
      boxes[to.to_i - 1].prepend(*(crate_mover == '9001' ? moved_crates : moved_crates.reverse))
    end

    boxes
  end

  def parse_command(command)
    command.match(/^move (\d+) from (\d+) to (\d+)$/)&.captures
  end

  def input
    @input ||= File.open('./05/input.txt').read
  end
end
