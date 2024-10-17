require 'engine/screen'
require 'screens/game/components/shape'

class GameScreen < Screen
  def initialize
    super

    @shape = Shape.new(
      0,
      0,
      [
        Square.new(0, 0, Colors::Tetromino::BLUE),
        Square.new(0, 1, Colors::Tetromino::ORANGE),
        Square.new(1, 0, Colors::Tetromino::PURPLE),
        Square.new(1, 1, Colors::Tetromino::YELLOW)
      ],
      Gosu::Color::CYAN
    )
  end

  def paint
    playfield_canvas = Gosu.render(Config::WAR_ZONE_WIDTH, Config::CANVAS_HEIGHT) do
      Gosu.draw_rect(
        0,
        0,
        Config::WAR_ZONE_WIDTH,
        Config::CANVAS_HEIGHT,
        Colors::Ui::BACKGROUND
      )
      @shape.draw
    end

    playfield_canvas.draw(Config::SIDEBAR_WIDTH, 0)
  end
end
