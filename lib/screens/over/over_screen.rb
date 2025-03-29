PADDING = 20

class OverScreen < Screen
  def initialize
    super
    @restart = false
    @quit = false
    @font = Gosu::Font.new(34)
    @message = 'Game Over!'
    @restart_button = Button.new '[R]estart', 4 * Config::SQUARE_WIDTH, 17 * Config::SQUARE_WIDTH
    @quit_button = Button.new '[Q]uit', 9 * Config::SQUARE_WIDTH, 17 * Config::SQUARE_WIDTH
  end

  def paint
    draw_popup
    @restart_button.draw
    @quit_button.draw
  end

  def update
    return [ScreenEvent::GO_TO_GAME] if @restart
    return [ScreenEvent::QUIT] if @quit

    []
  end

  def draw_popup
    text_width = @font.text_width(@message)
    text_height = @font.height
    box_width = PADDING * 2 + text_width
    box_height = PADDING * 2 + text_height
    box_x = (Config::CANVAS_WIDTH - box_width) / 2
    box_y = (Config::CANVAS_HEIGHT - box_height) / 2.67

    Gosu.draw_rect(box_x, box_y, box_width, box_height, Colors::Ui::POPUP_BACKGROUND)
    @font.draw_text(@message, (box_x + PADDING).floor, (box_y + PADDING), 0, 1, 1,
                    Colors::Ui::POPUP_TEXT)
  end

  def button_down(key, mouse_x, mouse_y)
    case key
    when Gosu::KB_S
      @restart = true
    when Gosu::KB_Q
      @quit = true
    when Gosu::MS_LEFT
      @restart = true if @restart_button.contains?(mouse_x, mouse_y)
      @quit = true if @quit_button.contains?(mouse_x, mouse_y)
    end
  end
end
