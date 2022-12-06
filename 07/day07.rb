# frozen_string_literal: true

require_relative '../puzzle'

# Day 7:
class Day07 < Puzzle
  private

  def input
    @input ||= File.open('./07/input.txt').read
  end
end
