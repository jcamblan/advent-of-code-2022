# frozen_string_literal: true

require_relative '../puzzle'

# Day 10: Cathode-Ray Tube
class Day10 < Puzzle
  INTERESTING_CYCLES = [20, 60, 100, 140, 180, 220].freeze

  def part1
    INTERESTING_CYCLES.map(&method(:signal_strength)).sum
  end

  def part2
    puts crt_rows.each_slice(40).map(&:join).join("\n")
    '👀'
  end

  private

  def crt_rows
    signal.each_with_object([]).with_index do |(_v, acc), index|
      r = register(index)
      acc << ([r - 1, r, r + 1].include?((index % 40)) ? '#' : ' ')
    end
  end

  def signal_strength(cycle) = signal(prepend: 1).dup[...cycle].sum * cycle
  def register(cycle) = signal.dup[...cycle].sum + 1

  def signal(prepend: nil)
    signal = input.lines(chomp: true).each_with_object([]) do |instruction, acc|
      case instruction
      when 'noop'
        acc << 0
      when /^addx (-??\d*)$/
        acc.append(0, ::Regexp.last_match(1).to_i)
      end
    end

    prepend ? signal.prepend(prepend) : signal
  end

  def input
    @input ||= File.open('./10/input.txt').read
  end
end
