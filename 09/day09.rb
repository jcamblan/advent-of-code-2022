# frozen_string_literal: true

require_relative '../puzzle'
require 'set'

# Day 9: Rope Bridge
class Day09 < Puzzle
  def part1
    set_globals(rope_size: 2)
    move_rope
  end

  def part2
    set_globals(rope_size: 10)
    move_rope
  end

  private

  def set_globals(rope_size:)
    @coords = Array.new(rope_size) { [0, 0] }
    @coord_histories = Array.new(rope_size) { Set.new }
  end

  def commands = input.lines(chomp: true).map(&:split)

  def move_rope
    input.lines(chomp: true).map(&:split).each do |direction, count|
      case direction
      when 'R' then move_right(count.to_i)
      when 'L' then move_left(count.to_i)
      when 'U' then move_up(count.to_i)
      when 'D' then move_down(count.to_i)
      end
    end

    @coord_histories.last.count
  end

  def move_up(count) = move_head(count) { |x, y| [x, y + 1] }
  def move_down(count) = move_head(count) { |x, y| [x, y - 1] }
  def move_right(count) = move_head(count) { |x, y| [x + 1, y] }
  def move_left(count) = move_head(count) { |x, y| [x - 1, y] }

  def move_head(count)
    count.times do
      x, y = @coords[0]
      @coords[0] = yield(x, y)
      @coord_histories[0] << @coords[0]
      move_tail
    end
  end

  def move_tail = @coords[1..].each.with_index { |_, i| move_tail_element(i, i + 1) }

  def move_tail_element(previous_index, current_index)
    xh, yh = @coords[previous_index]
    xt, yt = @coords[current_index]

    x_dist = xh - xt
    y_dist = yh - yt

    x_move = x_dist.negative? ? -1 : 1
    y_move = y_dist.negative? ? -1 : 1

    if x_dist.abs == 2 && y_dist.abs.zero?
      @coords[current_index] = [xt + x_move, yt]
    elsif x_dist.abs.zero? && y_dist.abs == 2
      @coords[current_index] = [xt, yt + y_move]
    elsif (x_dist.abs == 2 && y_dist.abs >= 1) || (x_dist.abs >= 1 && y_dist.abs == 2)
      @coords[current_index] = [xt + x_move, yt + y_move]
    end

    @coord_histories[current_index] << @coords[current_index]
  end

  def input
    @input ||= File.open('./09/input.txt').read
  end
end
