class MenuPainter < Painter
  def draw_background
    Gosu.draw_rect(0, 0, Config::CANVAS_WIDTH, Config::CANVAS_HEIGHT, Colors::Ui::BACKGROUND)
  end
end
