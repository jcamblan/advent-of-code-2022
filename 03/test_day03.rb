# frozen_string_literal: true

require 'minitest/autorun'

# Ensure that solution for the day works with examples
class TestDay03 < Minitest::Test
  def input
    <<~INPUT
      vJrwpWtwJgWrhcsFMMfFFhFp
      jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
      PmmdzqPrVvPwwTWBwg
      wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
      ttgJtRGJQctTZtZT
      CrZsJsPPZsGzwwsLwLmpwMDw
    INPUT
  end

  def setup
    @resolver = Day03.new(input)
  end

  def test_part1_result
    assert_equal 157, @resolver.part1
  end

  def test_part2_result
    assert_equal 70, @resolver.part2
  end
end
