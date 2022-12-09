# frozen_string_literal: true

require 'minitest/autorun'

# Ensure that solution for the day works with examples
class TestDay07 < Minitest::Test
  def input
    <<~INPUT
      R 4
      U 4
      L 3
      D 1
      R 4
      D 1
      L 5
      R 2
    INPUT
  end

  def setup
    @resolver = Day09.new(input)
  end

  def test_part1_result
    assert_equal 13, @resolver.part1
  end

  def test_part2_result
    skip
    assert_equal 'TODO', @resolver.part2
  end
end
