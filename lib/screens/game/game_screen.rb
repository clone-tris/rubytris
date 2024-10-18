class GameScreen < Screen
  def initialize
    super
    @score = Score.new
    @playfield = PlayfieldScreen.new(Config::WAR_ZONE_WIDTH, Config::CANVAS_HEIGHT)
    @next_player = Tetromino.random_tetromino
    @sidebar = SidebarScreen.new(Config::SIDEBAR_WIDTH, Config::CANVAS_HEIGHT, @score)
  end

  def paint
    next_player_canvas = Gosu.render(4 * Config::SQUARE_WIDTH, 2 * Config::SQUARE_WIDTH) do
      @sidebar.painter.draw_guide(4 * Config::SQUARE_WIDTH, 2 * Config::SQUARE_WIDTH)
      @next_player.draw
    end
    sidebar_ranvas = Gosu.render(Config::SIDEBAR_WIDTH, Config::CANVAS_HEIGHT) do
      @sidebar.paint(next_player_canvas)
    end
    playfield_canvas = Gosu.render(Config::WAR_ZONE_WIDTH, Config::CANVAS_HEIGHT) do
      @playfield.paint
    end

    sidebar_ranvas.draw(0, 0, 0)
    playfield_canvas.draw(Config::SIDEBAR_WIDTH, 0, 0)
  end
end
