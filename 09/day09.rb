# frozen_string_literal: true

require_relative '../puzzle'
require 'set'

# Day 9: Rope Bridge
class Day09 < Puzzle
  def part1
    @h_coord = [0, 0]
    @t_coord = [0, 0]

    @h_positions = Set.new
    @t_positions = Set.new

    input.lines(chomp: true).map(&:split).each { move(_1, _2.to_i) }

    @t_positions.count
  end

  private

  def move(direction, count)
    case direction
    when 'R' then move_right(count)
    when 'L' then move_left(count)
    when 'U' then move_up(count)
    when 'D' then move_down(count)
    end
    @h_positions << @h_coord
  end

  def move_up(count)
    count.times do
      x, y = @h_coord
      @h_coord = [x, y + 1]
      @h_positions << @h_coord
      move_t
    end
  end

  def move_down(count)
    count.times do
      x, y = @h_coord
      @h_coord = [x, y - 1]
      @h_positions << @h_coord
      move_t
    end
  end

  def move_right(count)
    count.times do
      x, y = @h_coord
      @h_coord = [x + 1, y]
      @h_positions << @h_coord
      move_t
    end
  end

  def move_left(count)
    count.times do
      x, y = @h_coord
      @h_coord = [x - 1, y]
      @h_positions << @h_coord
      move_t
    end
  end

  def move_t
    xh, yh = @h_coord
    xt, yt = @t_coord

    x_dist = xh - xt
    y_dist = yh - yt

    x_move = x_dist.negative? ? -1 : 1
    y_move = y_dist.negative? ? -1 : 1

    if x_dist.abs == 2 && y_dist.abs.zero?
      @t_coord = [xt + x_move, yt]
    elsif x_dist.abs.zero? && y_dist.abs == 2
      @t_coord = [xt, yt + y_move]
    elsif (x_dist.abs == 2 && y_dist.abs == 1) || (x_dist.abs == 1 && y_dist.abs == 2)
      @t_coord = [xt + x_move, yt + y_move]
    end

    @t_positions << @t_coord
  end

  def input
    @input ||= File.open('./09/input.txt').read
  end
end
