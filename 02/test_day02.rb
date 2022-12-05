# frozen_string_literal: true

require 'minitest/autorun'

# Ensure that solution for the day works with examples
class TestDay01 < Minitest::Test
  def input
    <<-INPUT
      A Y
      B X
      C Z
    INPUT
  end

  def setup
    @resolver = Day02.new(input)
  end

  def test_part1_result
    assert_equal 15, @resolver.part1
  end

  def test_part2_result
    assert_equal 12, @resolver.part2
  end
end
