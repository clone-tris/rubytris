class MenuScreen < Screen
  def initialize
    super
    @painter = MenuPainter.new
    @start = false
    @quit = false

    @graphic = Shape.new(0, 0, GRAPHIC_GRID, Colors::Square::DEFAULT_SQUARE_COLOR)

    @start_button = Button.new "[S]tart", 4 * Config::SQUARE_WIDTH, 17 * Config::SQUARE_WIDTH
    @quit_button = Button.new "[Q]uit", 9 * Config::SQUARE_WIDTH, 17 * Config::SQUARE_WIDTH
  end

  def paint
    @painter.draw_background
    @painter.draw_guide(Config::CANVAS_WIDTH, Config::CANVAS_HEIGHT)
    @graphic.draw
    @start_button.draw
    @quit_button.draw
  end

  def update
    return [ScreenEvent::GO_TO_GAME] if @start
    return [ScreenEvent::QUIT] if @quit

    []
  end

  def button_down(key, mouse_x, mouse_y)
    case key
    when Gosu::KB_S
      @start = true
    when Gosu::KB_Q
      @quit = true
    when Gosu::MS_LEFT
      @start = true if @start_button.contains?(mouse_x, mouse_y)
      @quit = true if @quit_button.contains?(mouse_x, mouse_y)
    end
  end
end
