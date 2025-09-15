class Painter
  # @param width [Integer]
  # @param height [Integer]
  def draw_guide(width, height)
    Gosu.draw_rect(0, 0, width, height, Colors::Ui::BACKGROUND)

    rows = height / Config::SQUARE_WIDTH
    columns = width / Config::SQUARE_WIDTH
    color = Colors::Ui::GUIDE

    0.upto(rows) do |i|
      line_y = i * Config::SQUARE_WIDTH
      Gosu.draw_line(0, line_y, color, width, line_y, color)
    end

    0.upto(columns) do |i|
      line_x = i * Config::SQUARE_WIDTH
      Gosu.draw_line(line_x, 0, color, line_x, height, color)
    end
  end
end
