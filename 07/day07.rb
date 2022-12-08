# frozen_string_literal: true

require_relative '../puzzle'

# Day 7:
class Day07 < Puzzle
  def initialize(input = nil)
    @pwd = []
    @files = []
    super
  end

  DISK_SPACE = 70_000_000
  MIN_SPACE_REQUIRED = 30_000_000

  def part1 = folder_sizes.values.select { _1 <= 100_000 }.sum

  def part2 = folder_sizes.values.select { _1 >= space_missing }.min

  private

  def free_space = DISK_SPACE - folder_sizes.values.first

  def space_missing = MIN_SPACE_REQUIRED - free_space

  def folder_sizes
    @folder_sizes ||= calculate_folder_sizes
  end

  def calculate_folder_sizes
    input.lines(chomp: true)
         .reject { _1.match?(/(\$ ls)|(dir *)/) }
         .each(&method(:parse_line))

    dir_paths = @files.map(&:first).uniq

    @files.each_with_object(Hash.new(0)) do |(dir, file_size), acc|
      dir_paths.each do |path|
        acc[path.dup] += file_size if dir.join.start_with?(path.join)
      end
    end
  end

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
