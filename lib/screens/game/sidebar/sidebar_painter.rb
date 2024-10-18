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

  def draw_next_player(next_player) end

  def draw_score(score) end
end
