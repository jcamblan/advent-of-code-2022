# frozen_string_literal: true

require 'minitest/autorun'

# Ensure that solution for the day works with examples
class TestDay04 < Minitest::Test
  def input
    <<~INPUT
      2-4,6-8
      2-3,4-5
      5-7,7-9
      2-8,3-7
      6-6,4-6
      2-6,4-8
    INPUT
  end

  def setup
    @resolver = Day04.new(input)
  end

  def test_part1_result
    assert_equal 2, @resolver.part1
  end

  def test_part2_result
    assert_equal 4, @resolver.part2
  end
end
