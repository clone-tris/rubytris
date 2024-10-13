$LOAD_PATH.unshift(File.expand_path('.', __dir__))

puts $LOAD_PATH

require 'gosu'

require 'config'
require 'screens/game/components/shape'

class Rubytris < Gosu::Window
  attr_reader :width, :height

  def initialize
    @width = 640
    @height = 480
    super(@width, @height)
    self.caption = 'Tutorial Game'

    shape = Shape.new(
      0,
      0,
      [
        Square.new(0, 0, Gosu::Color::AQUA),
        Square.new(0, 1, Gosu::Color::AQUA),
        Square.new(1, 0, Gosu::Color::AQUA),
        Square.new(1, 1, Gosu::Color::AQUA)
      ],
      Gosu::Color::CYAN
    )
    @buffer_image = Gosu.record(300, 300) do
      shape.draw
    end
  end

  def update; end

  def draw
    @buffer_image.draw(0, 0, 0)
  end
end

Rubytris.new.show
