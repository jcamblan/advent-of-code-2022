# frozen_string_literal: true

require 'minitest/autorun'

# Ensure that solution for the day works with examples
class TestDay07 < Minitest::Test
  def input
    <<~INPUT
      $ cd /
      $ ls
      dir a
      14848514 b.txt
      8504156 c.dat
      dir d
      $ cd a
      $ ls
      dir e
      29116 f
      2557 g
      62596 h.lst
      $ cd e
      $ ls
      584 i
      $ cd ..
      $ cd ..
      $ cd d
      $ ls
      4060174 j
      8033020 d.log
      5626152 d.ext
      7214296 k
    INPUT
  end

  def setup
    @resolver = Day07.new(input)
  end

  def test_part1_result
    assert_equal 95_437, @resolver.part1
  end

  def test_part2_result
    assert_equal 24_933_642, @resolver.part2
  end
end
