class PlayfieldPainter < Painter
  def draw_background
    Gosu.draw_rect(
      0,
      0,
      Config::WAR_ZONE_WIDTH,
      Config::CANVAS_HEIGHT,
      Colors::Ui::BACKGROUND
    )
  end
end
