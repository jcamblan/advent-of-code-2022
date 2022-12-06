# frozen_string_literal: true

require_relative '../puzzle'

# Day 4: Camp Cleanup
class Day04 < Puzzle
  private

  def input
    @input ||= File.open('./04/input.txt').read
  end
end
