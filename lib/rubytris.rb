require 'gosu'

class Rubytris < Gosu::Window
  attr_reader :width, :height

  def initialize
    @width = 640
    @height = 480
    super(@width, @height)
    self.caption = 'Tutorial Game'

    @buffer_image = Gosu.record(300, 300) do
      Gosu.draw_rect(0, 0, 100, 100, Gosu::Color::FUCHSIA)
      Gosu.draw_rect(100, 100, 300, 300, Gosu::Color::YELLOW)
    end
  end

  def update; end

  def draw
    @buffer_image.draw
  end
end

Rubytris.new.show
