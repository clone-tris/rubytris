WIDTH = Config::SQUARE_WIDTH
BORDER_WIDTH = Config::SQUARE_BORDER_WIDTH
W = WIDTH
BW = BORDER_WIDTH
R = W - BW * 2

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
  # @param squares [Array<Square>]
  # @param color [Gosu::Color]
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
      draw_square(square)
    end
  end

  # @param square [Square]
  # rubocop:disable Metrics/AbcSize
  def draw_square(square)
    x = (@column + square.column) * W
    y = (@row + square.row) * W
    Gosu.draw_rect(x, y, W, W, square.color)

    # Left
    Gosu.draw_triangle(
      x, y, Colors::Square::BORDER_SIDE,
      x + BW, y + BW, Colors::Square::BORDER_SIDE,
      x, y + BW, Colors::Square::BORDER_SIDE
    )
    Gosu.draw_rect(
      x,
      y + BW,
      BW, R,
      Colors::Square::BORDER_SIDE
    )
    Gosu.draw_triangle(
      x, y + BW + R, Colors::Square::BORDER_SIDE,
      x + BW, y + BW + R, Colors::Square::BORDER_SIDE,
      x, y + W, Colors::Square::BORDER_SIDE
    )

    # Top

    Gosu.draw_triangle(
      x, y, Colors::Square::BORDER_TOP,
      x + BW, y, Colors::Square::BORDER_TOP,
      x + BW, y + BW, Colors::Square::BORDER_TOP
    )
    Gosu.draw_rect(
      x + BW,
      y,
      R, BW,
      Colors::Square::BORDER_TOP
    )
    Gosu.draw_triangle(
      x + BW + R, y, Colors::Square::BORDER_TOP,
      x + W, y, Colors::Square::BORDER_TOP,
      x + BW + R, y + BW, Colors::Square::BORDER_TOP
    )

    # Right

    Gosu.draw_triangle(
      x + W, y, Colors::Square::BORDER_SIDE,
      x + W, y + BW, Colors::Square::BORDER_SIDE,
      x + R + BW, y + BW, Colors::Square::BORDER_SIDE
    )
    Gosu.draw_rect(
      x + BW + R,
      y + BW,
      BW, R,
      Colors::Square::BORDER_SIDE
    )
    Gosu.draw_triangle(
      x + BW + R, y + BW + R, Colors::Square::BORDER_SIDE,
      x + W, y + BW + R, Colors::Square::BORDER_SIDE,
      x + W, y + W, Colors::Square::BORDER_SIDE
    )

    # BOTTOM

    Gosu.draw_triangle(
      x + BW + R, y + BW + R, Colors::Square::BORDER_BOTTOM,
      x + W, y + W, Colors::Square::BORDER_BOTTOM,
      x + R + BW, y + W, Colors::Square::BORDER_BOTTOM
    )
    Gosu.draw_rect(
      x + BW,
      y + R + BW,
      R, BW,
      Colors::Square::BORDER_BOTTOM
    )
    Gosu.draw_triangle(
      x, y + W, Colors::Square::BORDER_BOTTOM,
      x + BW, y + BW + R, Colors::Square::BORDER_BOTTOM,
      x + BW, y + W, Colors::Square::BORDER_BOTTOM
    )
  end

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

  # @return [Shape]
  def copy
    Shape.new(@row, @column, @squares.map(&:copy), @color)
  end

  # @return [Array<Square>]
  def absolute_squares
    # make square calculate its own absolute position
    @squares.map do |square|
      square.absolute_copy(@row, @column)
    end
  end

  # @param row_direction [Integer]
  # @param column_direction [Integer]
  def translate(row_direction, column_direction)
    @row += row_direction
    @column += column_direction
  end

  def rotate
    @squares = @squares.map do |square|
      new_square = square.copy
      new_square.row = square.column
      new_square.column = @height - square.row - 1
      new_square
    end
    compute_size
  end

  # Checks if A collides with B
  # For better performance make sure A is the smallest shape
  #
  # @param b [Shape]
  # @return [Boolean]
  def collides_with?(b)
    b_squares_set = b.absolute_squares.map { |square| [square.row, square.column] }.to_set

    absolute_squares.any? do |square_a|
      b_squares_set.include?([square_a.row, square_a.column])
    end
  end

  # @param pray [Shape]
  def eat(pray)
    @squares.concat(pray.absolute_squares)
  end

  # @return Array<Integer>
  def remove_full_lines
    full_rows = find_full_rows
    return [] if full_rows.empty?

    @squares = @squares.each_with_object([]) do |square, grid|
      next if full_rows.include?(square.row)

      row_before_shifting = square.row
      full_rows.each do |full_row|
        square.row += 1 if full_row > row_before_shifting
      end
      grid.push(square)
    end

    full_rows
  end

  # @return Array<Integer>
  def find_full_rows
    population_dict = {}

    # @return Array<Integer>
    @squares.each_with_object([]) do |square, full_rows|
      population_dict[square.row] = population_dict.fetch(square.row, 0) + 1
      full_rows.push(square.row) if population_dict[square.row] >= Config::PUZZLE_WIDTH
    end
  end

  # @return [Boolean]
  def within_bounds?
    absolute_squares.all? do |square|
      square.column >= 0 &&
        square.column < Config::PUZZLE_WIDTH &&
        square.row < Config::PUZZLE_HEIGHT
    end
  end
end
