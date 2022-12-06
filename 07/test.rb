# frozen_string_literal: true

require 'minitest/autorun'

# Ensure that solution for the day works with examples
class TestDay07 < Minitest::Test
  def input
    <<~INPUT
    INPUT
  end

  def setup
    @resolver = Day07.new(input)
  end

  def test_part1_result
    skip
    assert_equal 'TODO', @resolver.part1
  end

  def test_part2_result
    skip
    assert_equal 'TODO', @resolver.part2
  end
end
