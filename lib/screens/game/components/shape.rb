require 'screens/game/components/square'

class Shape
  # @return [Integer]
  attr_accessor :row
  # @return [Integer]
  attr_accessor :column
  # @return [Integer]
  attr_accessor :width
  # @return [Integer]
  attr_accessor :height
  # @return [Gosu::Color]
  attr_accessor :color
  # @return [Array<Square>]
  attr_accessor :squares

  # @param row [Integer]
  # @param column [Integer]
  # @param width [Integer]
  # @param height [Integer]
  # @param color [Gosu::Color]
  # @param squares [Array<Square>]
  def initialize(row, column, squares, color)
    @row = row
    @column = column
    @squares = squares
    @color = color
    @width = 0
    @height = 0

    compute_size unless squares.empty?
  end

  def draw
    @squares.each do |square|
      square.draw(@row, @column)
    end
  end

  # rubocop:disable Metrics/AbcSize
  def compute_size
    min_row = Config::PUZZLE_HEIGHT
    max_row = 0
    min_column = Config::PUZZLE_WIDTH
    max_column = 0

    @squares.each do |square|
      max_row = square.row if square.row > max_row
      max_column = square.column if square.column > max_column
      min_row = square.row if square.row < min_row
      min_column = square.column if square.column < min_column
    end

    @height = max_row - min_row + 1
    @width = max_column - min_column + 1
  end
  # rubocop:enable Metrics/AbcSize
end
