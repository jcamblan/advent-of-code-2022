# frozen_string_literal: true

require_relative '../puzzle'

# Day 2: Rock Paper Scissors
class Day02 < Puzzle
  MOVES = %w[rock paper scissors].freeze
  HIS = %w[A B C].freeze
  MINE = %w[X Y Z].freeze

  CASES = {
    %w[rock paper].sort => 'paper',
    %w[rock scissors].sort => 'rock',
    %w[paper scissors].sort => 'scissors'
  }.freeze

  def part1
    calculate_score do |elf_input, my_input|
      score(MOVES[HIS.index(elf_input)], MOVES[MINE.index(my_input)])
    end
  end

  def part2
    calculate_score do |elf_input, win_command|
      elf_move = MOVES[HIS.index(elf_input)]
      my_move = case win_command
                when 'X' then lose_against(elf_move)
                when 'Y' then elf_move
                when 'Z' then win_against(elf_move)
                end

      score(elf_move, my_move)
    end
  end

  private

  def calculate_score(&block)
    input.lines(chomp: true).map(&:split).sum(&block)
  end

  def score(elf_move, my_move)
    return move_value(my_move) + 3 if elf_move == my_move

    if CASES[[elf_move, my_move].sort] == my_move
      move_value(my_move) + 6
    else
      move_value(my_move)
    end
  end

  def move_value(move)
    MOVES.index(move) + 1
  end

  def input
    @input ||= File.open('./02/input.txt').read
  end

  def win_against(move)
    (CASES.find { |k, v| k.include?(move) && v != move }.first - [move]).first
  end

  def lose_against(move)
    (CASES.find { |k, v| k.include?(move) && v == move }.first - [move]).first
  end
end
