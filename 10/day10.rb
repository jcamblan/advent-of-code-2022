# frozen_string_literal: true

require_relative '../puzzle'

# Day 10: Cathode-Ray Tube
class Day10 < Puzzle
  INTERESTING_CYCLES = [20, 60, 100, 140, 180, 220].freeze

  def part1
    INTERESTING_CYCLES.map(&method(:signal_strength)).sum
  end

  private

  def signal_strength(cycle) = signal[..cycle-1].sum * cycle

  def signal
    input.lines(chomp: true).each_with_object([1]) do |instruction, acc|
      case instruction
      when 'noop'
        acc << 0
      when /^addx (-??\d*)$/
        acc.append(0, ::Regexp.last_match(1).to_i)
      end
    end
  end

  def input
    @input ||= File.open('./10/input.txt').read
  end
end
