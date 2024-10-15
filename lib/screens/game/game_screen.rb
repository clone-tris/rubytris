require 'engine/screen'
require 'screens/game/components/shape'

class GameScreen < Screen
  # @return Gosu::Image
  attr_accessor :buffer_image

  def initialize
    @shape = Shape.new(
      0,
      0,
      [
        Square.new(0, 0, Gosu::Color::AQUA),
        Square.new(0, 1, Gosu::Color::GRAY),
        Square.new(1, 0, Gosu::Color::FUCHSIA),
        Square.new(1, 1, Gosu::Color::GREEN)
      ],
      Gosu::Color::CYAN
    )
  end

  def paint
    playfiend_canvas = Gosu.record(Config::WAR_ZONE_WIDTH, Config::CANVAS_HEIGHT) do
      Gosu.draw_rect(
        0,
        0,
        Config::WAR_ZONE_WIDTH,
        Config::CANVAS_HEIGHT,
        Gosu::Color.rgba(0x333333ff)
      )
      @shape.draw
    end

    playfiend_canvas.draw(Config::SIDEBAR_WIDTH, 0)
  end
end
