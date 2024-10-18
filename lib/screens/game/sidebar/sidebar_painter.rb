class SidebarPainter < Painter
  def initialize
    super

    @font = Gosu::Font.new(18)
  end

  # @param width [Integer]
  # @param height [Integer]
  def draw_background(width, height)
    Gosu.draw_rect(
      0,
      0,
      width,
      height,
      Colors::Ui::SIDEBAR_BACKGROUND
    )
  end

  # @param next_player_canvas [Gosu::Image]
  def draw_next_player(next_player_canvas)
    next_player_canvas.draw(Config::SQUARE_WIDTH, Config::SQUARE_WIDTH, 0)
  end

  # @param score [Score]
  def draw_score(score)
    @font.draw_text("Level\n#{score.level}", (Config::SQUARE_WIDTH / 3).floor, Config::SQUARE_WIDTH * 4, 0)
    @font.draw_text("Cleared\n#{score.lines_cleared}", (Config::SQUARE_WIDTH / 3).floor, Config::SQUARE_WIDTH * 6, 0)
    @font.draw_text("Score\n#{score.total}", (Config::SQUARE_WIDTH / 3).floor, Config::SQUARE_WIDTH * 8, 0)
  end
end
