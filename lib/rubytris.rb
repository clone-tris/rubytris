require 'gosu'

require_relative 'config'
require_relative 'screens/game/components/square'

class Rubytris < Gosu::Window
  attr_reader :width, :height

  def initialize
    @width = 640
    @height = 480
    super(@width, @height)
    self.caption = 'Tutorial Game'

    square = Square.new(0, 1, Gosu::Color::AQUA)
    @buffer_image = Gosu.record(300, 300) do
      square.draw(0, 0)
    end
  end

  def update; end

  def draw
    @buffer_image.draw(0, 0, 0)
  end
end

Rubytris.new.show
