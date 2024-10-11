require 'gosu'

class Player
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end
end

class Tutorial < Gosu::Window
  def initialize
    super 640, 480
    self.caption = 'Tutorial Game'
    @player = Player.new(20, 20)
  end

  def update
    # ...
  end

  def draw
    Gosu.draw_rect(@player.x, @player.y, 50, 50, Gosu::Color::AQUA)
  end
end

Tutorial.new.show
