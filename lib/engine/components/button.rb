BUTTON_PADDING_LEFT = 8
BUTTON_PADDING_TOP = 8

class Button
  # rubocop:disable Metrics/AbcSize
  def initialize(text, x, y)
    @text = text
    @font = Gosu::Font.new(24)
    @text_width = @font.text_width(@text)
    @text_height = @font.height
    @width = 2 * BUTTON_PADDING_LEFT + @text_width
    @height = 2 * BUTTON_PADDING_TOP + @text_height
    @x = x
    @y = y
    @text_x = (x + (@width - @text_width) / 2).floor
    @text_y = (y + (@height - @text_height) / 2).floor
  end
  # rubocop:enable Metrics/AbcSize

  def draw
    Gosu.draw_rect(@x, @y, @width, @height, Colors::Tetromino::CYAN)
    @font.draw_text(@text, @text_x, @text_y, 0, 1, 1, Colors::Ui::BUTTON_TEXT)
  end

  def contains?(x, y)
    x >= @x && x <= (@x + @width) && y >= @y && y <= (@y + @height)
  end
end
