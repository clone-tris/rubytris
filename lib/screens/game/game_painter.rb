class GamePainter < Painter
  def initialize
    super

    @font = Gosu::Font.new(18)
  end

  # @params next_player [Shape]
  # @params score [Score]
  def draw_sidebar(next_player, score)
    next_player_canvas = Gosu.render(4 * Config::SQUARE_WIDTH, 2 * Config::SQUARE_WIDTH) do
      draw_guide(4 * Config::SQUARE_WIDTH, 2 * Config::SQUARE_WIDTH)
      next_player.draw
    end
    draw_sidebar_background(Config::SIDEBAR_WIDTH, Config::CANVAS_HEIGHT)
    draw_next_player(next_player_canvas)
    draw_score(score)
  end

  # @params playfield [PlayfieldScreen]
  def draw_playfield(opponent, player)
    Gosu.render(Config::WAR_ZONE_WIDTH, Config::CANVAS_HEIGHT) do
      draw_guide(Config::WAR_ZONE_WIDTH, Config::CANVAS_HEIGHT)
      opponent.draw
      player.draw
    end
  end

  # @param width [Integer]
  # @param height [Integer]
  def draw_sidebar_background(width, height)
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
    @font.draw_text(
      "Level\n#{score.level}",
      Config::SQUARE_WIDTH / 3,
      Config::SQUARE_WIDTH * 4,
      0
    )
    @font.draw_text(
      "Cleared\n#{score.lines_cleared}",
      Config::SQUARE_WIDTH / 3,
      Config::SQUARE_WIDTH * 6,
      0
    )
    @font.draw_text(
      "Score\n#{score.total}",
      Config::SQUARE_WIDTH / 3,
      Config::SQUARE_WIDTH * 8,
      0
    )
  end
end
