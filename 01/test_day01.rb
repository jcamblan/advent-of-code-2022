# frozen_string_literal: true

require 'minitest/autorun'

# Ensure that solution for the day works with examples
class TestDay01 < Minitest::Test
  def input
    <<-INPUT
      1000
      2000
      3000

      4000

      5000
      6000

      7000
      8000
      9000

      10000
    INPUT
  end

  def setup
    @resolver = Day01.new(input)
  end

  def test_part1_result
    assert_equal 24_000, @resolver.part1
  end

  def test_part2_result
    assert_equal 'TODO', @resolver.part2
  end
end
