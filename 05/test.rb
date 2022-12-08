# frozen_string_literal: true

require 'minitest/autorun'

# Ensure that solution for the day works with examples
class TestDay05 < Minitest::Test
  # rubocop:disable Layout/TrailingWhitespace
  def input
    <<~INPUT
          [D]    
      [N] [C]    
      [Z] [M] [P]
       1   2   3 

      move 1 from 2 to 1
      move 3 from 1 to 3
      move 2 from 2 to 1
      move 1 from 1 to 2
    INPUT
  end
  # rubocop:enable Layout/TrailingWhitespace

  def setup
    @resolver = Day05.new(input)
  end

  def test_part1_result
    assert_equal 'CMZ', @resolver.part1
  end

  def test_part2_result
    assert_equal 'MCD', @resolver.part2
  end
end
