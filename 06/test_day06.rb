# frozen_string_literal: true

require 'minitest/autorun'

# Ensure that solution for the day works with examples
class TestDay06 < Minitest::Test
  def input
    "mjqjpqmgbljsphdztnvjfqwrcgsmlb"
  end

  def setup
    @resolver = Day06.new(input)
  end

  def test_part1_result
    assert_equal 7, @resolver.part1
  end

  def test_part2_result
    assert_equal 19, @resolver.part2
  end
end
