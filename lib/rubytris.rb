require 'gosu'

class Player
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end
end

class Rubytris < Gosu::Window
  def initialize
    super 640, 480
    self.caption = 'Tutorial Game'
    @player = Player.new(20, 20)
  end

  def update
    @player.x = (@player.x + 0.1) %
                @player.y += 0.5
  end

  def draw
    Gosu.draw_rect(@player.x, @player.y, 50, 50, Gosu::Color::AQUA)
  end
end

Rubytris.new.show
