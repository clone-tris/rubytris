class SidebarPainter < Painter
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

  def draw_score(score) end
end
