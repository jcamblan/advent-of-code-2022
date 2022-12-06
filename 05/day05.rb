# frozen_string_literal: true

require_relative '../puzzle'

# Day 5:
class Day05 < Puzzle
  private

  def input
    @input ||= File.open('./05/input.txt').read
  end
end
