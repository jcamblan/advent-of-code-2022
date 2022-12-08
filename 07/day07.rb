# frozen_string_literal: true

require_relative '../puzzle'

# Day 7:
class Day07 < Puzzle
  def initialize(input = nil)
    @pwd = []
    @files = []
    super
  end

  def part1
    input.lines(chomp: true)
         .reject { _1.match?(/(\$ ls)|(dir *)/) }
         .each(&method(:parse_line))

    dir_paths = @files.map(&:first).uniq

    hash = @files.each_with_object(Hash.new(0)) do |(dir, file_size), acc|
      dir_paths.each do |path|
        acc[path.dup] += file_size if dir.join.start_with?(path.join)
      end
    end

    hash.values.select { _1 <= 100_000 }.sum
  end

  private

  def parse_line(line)
    if (path = line.match(/\$ cd (.*)/)&.captures&.first)
      if path == '..'
        @pwd.pop
      else
        @pwd.append(path)
        @files << [@pwd.dup, 0]
      end
    else
      length, = line.split
      @files << [@pwd.dup, length.to_i]
    end
  end

  def input
    @input ||= File.open('./07/input.txt').read
  end
end
