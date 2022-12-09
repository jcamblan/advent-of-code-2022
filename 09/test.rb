# frozen_string_literal: true

require 'minitest/autorun'

# Ensure that solution for the day works with examples
class TestDay09 < Minitest::Test
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

  def input2
    <<~INPUT
      R 5
      U 8
      L 8
      D 3
      R 17
      D 10
      L 25
      U 20
    INPUT
  end

  def test_part1_result
    assert_equal 13, Day09.new(input).part1
  end

  def test_part2a_result
    assert_equal 1, Day09.new(input).part2
  end

  def test_part2b_result
    assert_equal 36, Day09.new(input2).part2
  end
end
