class GamePainter < Painter
  # @params sidebar [SidebarScreen]
  # @params next_player [Shape]
  def draw_sidebar(sidebar, next_player)
    next_player_canvas = Gosu.render(4 * Config::SQUARE_WIDTH, 2 * Config::SQUARE_WIDTH) do
      draw_guide(4 * Config::SQUARE_WIDTH, 2 * Config::SQUARE_WIDTH)
      next_player.draw
    end
    Gosu.render(Config::SIDEBAR_WIDTH, Config::CANVAS_HEIGHT) do
      sidebar.paint(next_player_canvas)
    end
  end

  # @params playfield [PlayfieldScreen]
  def draw_playfield(opponent, player)
    Gosu.render(Config::WAR_ZONE_WIDTH, Config::CANVAS_HEIGHT) do
      draw_guide(Config::WAR_ZONE_WIDTH, Config::CANVAS_HEIGHT)
      opponent.draw
      player.draw
    end
  end
end
