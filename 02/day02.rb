# frozen_string_literal: true

require_relative '../puzzle'

# Day 2: Rock Paper Scissors
class Day02 < Puzzle
  PLAYS = %w[rock paper scissors].freeze
  HIS = %w[A B C].freeze
  MINE = %w[X Y Z].freeze

  CASES = {
    %w[rock paper].sort => 'paper',
    %w[rock scissors].sort => 'rock',
    %w[paper scissors].sort => 'scissors'
  }.freeze

  def part1
    scores = input.lines(chomp: true).map(&:split).map do |his, mine|
      score(PLAYS[HIS.index(his)], PLAYS[MINE.index(mine)])
    end
    scores.sum
  end

  private

  def score(elf_play, my_play)
    return play_value(my_play) + 3 if elf_play == my_play

    if CASES[[elf_play, my_play].sort] == my_play
      play_value(my_play) + 6
    else
      play_value(my_play)
    end
  end

  def play_value(play)
    PLAYS.index(play) + 1
  end

  def input
    @input ||= File.open('./02/input.txt').read
  end
end
