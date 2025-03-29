WIDTH = Config::SQUARE_WIDTH
BORDER_WIDTH = Config::SQUARE_BORDER_WIDTH
W = WIDTH
BW = BORDER_WIDTH
R = W - BW * 2

class Square
  # @return [Integer]
  attr_accessor :row
  # @return [Integer]
  attr_accessor :column
  # @return [Gosu::Color]
  attr_accessor :color

  # @param row [Integer]
  # @param column [Integer]
  # @param color [Gosu::Color]
  def initialize(row, column, color)
    @row = row
    @column = column
    @color = color
  end

  # @param ref_row [Integer]
  # @param ref_column [Integer]
  # rubocop:disable Metrics/AbcSize
  def draw(ref_row, ref_column)
    x = (ref_column + @column) * W
    y = (ref_row + @row) * W
    Gosu.draw_rect(x, y, W, W, @color)

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
  # rubocop:enable Metrics/AbcSize

  # @param ref_row [Integer]
  # @param ref_column [Integer]
  # @return [Square]
  def absolute_copy(ref_row, ref_column)
    c = copy
    c.column += ref_column
    c.row += ref_row
    c
  end

  # @return [Square]
  def copy
    Square.new(@row, @column, @color)
  end
end
