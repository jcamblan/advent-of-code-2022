# frozen_string_literal: true

require 'minitest/autorun'

# Ensure that solution for the day works with examples
class TestDay07 < Minitest::Test
  def input
    <<~INPUT
      30373
      25512
      65332
      33549
      35390
    INPUT
  end

  def setup
    @resolver = Day08.new(input)
  end

  def test_part1_result
    assert_equal 21, @resolver.part1
  end

  def test_part2_result
    assert_equal 8, @resolver.part2
  end
end
