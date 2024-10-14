$LOAD_PATH.unshift(File.expand_path('.', __dir__))

require 'gosu'

require 'config'
require 'screens/game/components/shape'

class Rubytris < Gosu::Window
  attr_reader :width, :height

  def initialize
    @width = Config::CANVAS_WIDTH
    @height = Config::CANVAS_HEIGHT
    super(@width, @height)
    self.caption = 'Tutorial Game'

    shape = Shape.new(
      9,
      3,
      [
        Square.new(0, 0, Gosu::Color::AQUA),
        Square.new(0, 1, Gosu::Color::GRAY),
        Square.new(1, 0, Gosu::Color::FUCHSIA),
        Square.new(1, 1, Gosu::Color::GREEN)
      ],
      Gosu::Color::CYAN
    )

    print(shape.within_bounds)

    @buffer_image = Gosu.record(Config::WAR_ZONE_WIDTH, Config::CANVAS_HEIGHT) do
      shape.draw
    end
  end

  def update; end

  def draw
    Gosu.draw_rect(
      Config::SIDEBAR_WIDTH,
      0,
      Config::WAR_ZONE_WIDTH,
      Config::CANVAS_HEIGHT,
      Gosu::Color.rgba(0x333333ff)
    )

    @buffer_image.draw(Config::SIDEBAR_WIDTH, 0, 0)
  end
end

Rubytris.new.show
