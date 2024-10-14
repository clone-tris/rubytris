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
  def draw(ref_row, ref_column)
    width = Config::SQUARE_WIDTH
    (x, y) = to_absolute(ref_row, ref_column)
    Gosu.draw_rect(x, y, width, width, @color)
  end

  # @param ref_row [Integer]
  # @param ref_column [Integer]
  # @return [Array<(Integer, Integer)>]
  def to_absolute(ref_row, ref_column)
    width = Config::SQUARE_WIDTH
    x = (ref_column + @column) * width
    y = (ref_row + @row) * width
    [x, y]
  end

  def copy
    Square.new(@row, @column, @color)
  end
end
