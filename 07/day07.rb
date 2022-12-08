# frozen_string_literal: true

require_relative '../puzzle'

# Day 7:
class Day07 < Puzzle
  def initialize(input = nil)
    @pwd = []
    @filesystem = []
    super
  end

  def part1
    lines = input.lines(chomp: true).reject { _1.match?(/(\$ ls)|(dir *)/) }

    toto = lines.map(&method(:parse_line)).compact

    hash = toto.map(&:first).uniq.to_h { [_1, []] }

    toto.each do |dir, file_size|
      hash.each_key do |key|
        hash[key] << file_size.to_i if dir.join.start_with?(key.join)
      end
    end

    tata = hash.transform_values(&:sum).select { |_k, v| v <= 100_000 }

    tata.sum(&:last)
  end

  private

  def parse_line(line)
    if (path = line.match(/\$ cd (.*)/)&.captures&.first)
      if path == '..'
        @pwd = @pwd[..-2]
      else
        @pwd = @pwd.dup.append(path)
      end
      nil
    else
      length, = line.split(' ')
      [@pwd, length]
    end
  end

  def input
    @input ||= File.open('./07/input.txt').read
  end
end
