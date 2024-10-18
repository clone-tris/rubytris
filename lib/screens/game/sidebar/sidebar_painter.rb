class SidebarPainter < Painter
  def draw_background
    Gosu.draw_rect(
      0,
      0,
      Config::SIDEBAR_WIDTH,
      Config::CANVAS_HEIGHT,
      Colors::Tetromino::CYAN
    )
  end
end
