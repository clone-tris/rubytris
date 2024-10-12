class Square
  attr_accessor :row, :column, :color

  def initialize(row, column, color)
    @row = row
    @column = column
    @color = color
  end

  def draw(ref_row, ref_column)
    width = Config::SQUARE_WIDTH
    x = (ref_column + @column) * width
    y = (ref_row + @row) * width
    Gosu.draw_rect(x, y, width, width, Gosu::Color::BLUE)
  end
end
