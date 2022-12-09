# frozen_string_literal: true

require_relative '../puzzle'
require 'set'

class String
  def coordinates_in(grid)
    @grid = grid
    [@grid.index(row), row.index(cell)]
  end

  def row
    case @grid
    in [*, [*, [*, self, *], *] => r, *]
      r
    end
  end

  def cell
    case row
    in [*, [*, self, *] => c, *]
      c
    end
  end
end

# Day 9: Rope Bridge
class Day09 < Puzzle
  H = 'H'
  T = 'T'

  def part1
    @max_width = 0
    @max_heigth = 0
    @grid = [[[H, T]]]
    @h_positions = Set.new
    @t_positions = Set.new

    input.lines(chomp: true).map(&:split).each { move(_1, _2.to_i) }

    @t_positions.count
  end

  private

  def h_coord = 'H'.dup.coordinates_in(@grid)
  def t_coord = 'T'.dup.coordinates_in(@grid)

  def move(direction, count)
    case direction
    when 'R' then move_right(count)
    when 'L' then move_left(count)
    when 'U' then move_up(count)
    when 'D' then move_down(count)
    end
    @h_positions << h_coord
  end

  def move_up(count)
    add_lines(count + h_coord[0] - @max_heigth) if count + h_coord[0] > @max_heigth
    count.times do
      @grid[h_coord[0] + 1][h_coord[1]] << @grid[h_coord[0]][h_coord[1]].delete('H')
      @h_positions << h_coord
      move_t
    end
  end

  def move_down(count)
    count.times do
      @grid[h_coord[0] - 1][h_coord[1]] << @grid[h_coord[0]][h_coord[1]].delete('H')
      @h_positions << h_coord
      move_t
    end
  end

  def move_right(count)
    add_cells(count + h_coord[1] - @max_width) if count + h_coord[1] > @max_width
    count.times do
      @grid[h_coord[0]][h_coord[1] + 1] << @grid[h_coord[0]][h_coord[1]].delete('H')
      @h_positions << h_coord
      move_t
    end
  end

  def move_left(count)
    count.times do
      @grid[h_coord[0]][h_coord[1] - 1] << @grid[h_coord[0]][h_coord[1]].delete('H')
      @h_positions << h_coord
      move_t
    end
  end

  def move_t
    y_change = h_coord[0] - t_coord[0]
    x_change = h_coord[1] - t_coord[1]

    if y_change.abs == 2 && x_change.abs == 0
      change = y_change.negative? ? -1 : 1
      @grid[t_coord[0] + change][t_coord[1]] << @grid[t_coord[0]][t_coord[1]].delete('T')
    elsif y_change.abs == 0 && x_change.abs == 2
      change = x_change.negative? ? -1 : 1
      @grid[t_coord[0]][t_coord[1] + change] << @grid[t_coord[0]][t_coord[1]].delete('T')
    elsif (y_change.abs == 2 && x_change.abs == 1) || y_change.abs == 1 && x_change.abs == 2
      y_move = y_change.negative? ? -1 : 1
      x_move = x_change.negative? ? -1 : 1
      @grid[t_coord[0] + y_move][t_coord[1] + x_move] << @grid[t_coord[0]][t_coord[1]].delete('T')
    end

    puts h_coord.to_s + '  ' + t_coord.to_s
    @t_positions << t_coord
  end

  def add_lines(count)
    count.times { @grid.append(Array.new(@grid.first.count) { [] }) }
  end

  def add_cells(count)
    @grid.each.with_index { |_, i| count.times { @grid[i].append([]) } }
  end

  def input
    @input ||= File.open('./09/input.txt').read
  end
end
